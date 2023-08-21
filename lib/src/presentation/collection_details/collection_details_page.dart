import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../../routes/app_router.dart';
import '../../shared/widgets/templates/error_template.dart';
import '../../utils/localizations.dart';
import 'cubit/filter.dart';
import 'cubit/find_collection_details_cubit.dart';
import 'widgets/details_loaded.dart';
import 'widgets/filter_bottom_sheet/filter_bottom_sheet.dart';

@RoutePage()
class CollectionDetailsPage extends StatelessWidget {
  final String id;

  const CollectionDetailsPage({
    super.key,
    @PathParam('id') required this.id,
  });

  void _onPressEdit(
    BuildContext context,
    CollectionWithTemplate collectionWithTemplate,
  ) =>
      context.router.push(
        EditCollectionRoute(
          collection: Collection.fromCollectionWithTemplate(collectionWithTemplate),
        ),
      );

  void _onPressFilter(BuildContext context) async {
    final cubit = context.read<FindCollectionDetailsCubit>();

    final filter = await showModalBottomSheet<Filter>(
      context: context,
      builder: (context) => FilterBottomSheet(
        filter: cubit.filter,
      ),
    );

    if (filter != null) {
      cubit.filterCollection(filter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<FindCollectionDetailsCubit>(param1: id)..loadCollectionDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.strings.collectionDetails),
          actions: [
            BlocSelector<FindCollectionDetailsCubit, FindCollectionDetailsState, bool>(
              selector: (state) => state is FindCollectionDetailsSuccess,
              builder: (context, isDetailsLoaded) {
                return isDetailsLoaded
                    ? IconButton(
                        icon: const Icon(Icons.filter_alt_outlined),
                        onPressed: () => _onPressFilter(context),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: BlocBuilder<FindCollectionDetailsCubit, FindCollectionDetailsState>(
          builder: (context, state) {
            Widget child;

            if (state is FindCollectionDetailsLoading) {
              child = const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FindCollectionDetailsSuccess) {
              child = const DetailsLoaded();
            } else {
              child = ErrorTemplate(
                onRetry: context.read<FindCollectionDetailsCubit>().loadCollectionDetails,
              );
            }

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: child,
            );
          },
        ),
        floatingActionButton: BlocBuilder<FindCollectionDetailsCubit, FindCollectionDetailsState>(
          buildWhen: (previous, current) =>
              current is FindCollectionDetailsSuccess || previous is FindCollectionDetailsSuccess,
          builder: (context, state) => state is FindCollectionDetailsSuccess && state.originalCollection.canEdit
              ? FloatingActionButton(
                  onPressed: () => _onPressEdit(context, state.originalCollection),
                  child: const Icon(Icons.edit_outlined),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

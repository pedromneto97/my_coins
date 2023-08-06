import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../shared/widgets/templates/error_template.dart';
import '../../utils/localizations.dart';
import 'cubit/find_collection_details_cubit.dart';
import 'widgets/details_loaded.dart';

@RoutePage()
class CollectionDetailsPage extends StatelessWidget {
  final String id;

  const CollectionDetailsPage({
    super.key,
    @PathParam('id') required this.id,
  });

  void _onPressEdit(BuildContext context) {}

  void _onPressDelete(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<FindCollectionDetailsCubit>(param1: id)..loadCollectionDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.strings.collectionDetails),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _onPressEdit(context),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _onPressDelete(context),
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
              child = DetailsLoaded(collection: state.collection);
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
      ),
    );
  }
}

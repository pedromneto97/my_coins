import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../routes/app_router.dart';
import '../../shared/widgets/templates/error_template.dart';
import '../../utils/localizations.dart';
import 'cubit/get_user_collections/get_user_collections_cubit.dart';
import 'widgets/empty_collections.dart';
import 'widgets/user_collections_loaded.dart';

@RoutePage()
class UserCollectionsPage extends StatelessWidget {
  const UserCollectionsPage({super.key});

  void _onTapAddCollection(BuildContext context) => context.router.push(const CreateCollectionRoute());

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocProvider<GetUserCollectionsCubit>(
      create: (context) => GetIt.I.get()..getUserCollections(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.myCollections),
        ),
        body: BlocBuilder<GetUserCollectionsCubit, GetUserCollectionsState>(
          builder: (context, state) {
            Widget child;

            if (state is EmptyUserCollections) {
              child = const EmptyCollections();
            } else if (state is GetUserCollectionsLoaded) {
              child = UserCollectionsLoaded(
                collections: state.collections,
              );
            } else if (state is GetUserCollectionsLoading) {
              child = const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetUserCollectionsError) {
              child = ErrorTemplate(
                onRetry: context.read<GetUserCollectionsCubit>().getUserCollections,
              );
            } else {
              child = const SizedBox.shrink();
            }

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: child,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onTapAddCollection(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../shared/widgets/templates/error_template.dart';
import '../../utils/localizations.dart';
import 'cubit/get_public_collections_cubit.dart';
import 'widgets/empty_public_collections.dart';
import 'widgets/public_collections_loaded.dart';

@RoutePage()
class PublicCollectionsPage extends StatelessWidget {
  const PublicCollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<GetPublicCollectionsCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.strings.collections),
        ),
        body: BlocBuilder<GetPublicCollectionsCubit, GetPublicCollectionsState>(
          builder: (context, state) {
            Widget child;

            if (state is GetPublicCollectionsError) {
              child = ErrorTemplate(
                onRetry: context.read<GetPublicCollectionsCubit>().load,
              );
            } else if (state is GetPublicCollectionsLoaded) {
              child = PublicCollectionsLoaded(
                collections: state.collections,
              );
            } else if (state is GetPublicCollectionsEmpty) {
              child = const EmptyPublicCollections();
            } else {
              child = const Center(
                child: CircularProgressIndicator(),
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

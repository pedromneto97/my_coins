import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/domain.dart';
import '../../../../routes/app_router.dart';
import '../../../../utils/localizations.dart';
import 'cubit/delete_collection_cubit.dart';

class ConfirmDeleteCollection extends StatelessWidget {
  final Collection collection;

  const ConfirmDeleteCollection({
    super.key,
    required this.collection,
  });

  void _onDeleteCollectionStateChange(BuildContext context, DeleteCollectionState state) {
    if (state is DeleteCollectionSuccess) {
      context.router.popUntil((route) => route.settings.name == UserCollectionsRoute.name);
      return;
    }
    if (state is DeleteCollectionFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.strings.failedToDeleteCollection),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocProvider(
      create: (context) => GetIt.I.get<DeleteCollectionCubit>(param1: collection),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    strings.confirmDeleteCollection,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text(strings.no),
                  ),
                ),
                const SizedBox(width: 8),
                BlocConsumer<DeleteCollectionCubit, DeleteCollectionState>(
                  listener: _onDeleteCollectionStateChange,
                  builder: (context, state) {
                    final isLoading = state is DeleteCollectionLoading;

                    return Expanded(
                      child: FilledButton(
                        onPressed: isLoading ? null : context.read<DeleteCollectionCubit>().deleteCollection,
                        child: isLoading ? const CircularProgressIndicator() : Text(strings.yes),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../routes/app_router.dart';

class UserCollectionsLoaded extends StatelessWidget {
  final List<Collection> collections;

  const UserCollectionsLoaded({
    super.key,
    required this.collections,
  });

  void _openCollectionDetails(BuildContext context, Collection collection) => context.router.push(
        CollectionDetailsRoute(id: collection.id),
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];

        return ListTile(
          key: Key(collection.id),
          title: Text(collection.name),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _openCollectionDetails(context, collection),
        );
      },
    );
  }
}

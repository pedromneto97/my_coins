import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class UserCollectionsLoaded extends StatelessWidget {
  final List<Collection> collections;

  const UserCollectionsLoaded({
    super.key,
    required this.collections,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];

        return ListTile(
          title: Text(collection.name),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import 'collection_item.dart';

class DetailsLoaded extends StatelessWidget {
  final CollectionWithTemplate collection;

  const DetailsLoaded({
    super.key,
    required this.collection,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          sliver: SliverToBoxAdapter(
            child: Text(
              collection.name,
              style: textTheme.titleLarge,
            ),
          ),
        ),
        for (final family in collection.coinFamily) ...[
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                family.name,
                style: textTheme.titleLarge,
              ),
            ),
          ),
          for (final group in family.coinGroup) ...[
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  group.name,
                  style: textTheme.titleMedium,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: group.coins.length,
                itemBuilder: (context, index) {
                  final item = group.coins[index];

                  return CollectionItem(
                    key: ValueKey(item.id),
                    item: item,
                    group: group.name,
                    family: family.name,
                    collectionId: collection.id,
                  );
                },
              ),
            ),
          ]
        ]
      ],
    );
  }
}

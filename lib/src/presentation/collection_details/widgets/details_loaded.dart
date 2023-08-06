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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            collection.name,
          ),
        ),
        for (final family in collection.coinFamily) ...[
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                family.name,
              ),
            ),
          ),
          for (final group in family.coinGroup) ...[
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  group.name,
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

                  return CollectionItem(item: item);
                },
              ),
            ),
          ]
        ]
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../cubit/find_collection_details_cubit.dart';
import 'collection_item.dart';

class DetailsLoaded extends StatelessWidget {
  const DetailsLoaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        BlocSelector<FindCollectionDetailsCubit, FindCollectionDetailsState, String>(
          selector: (state) => state is FindCollectionDetailsSuccess ? state.originalCollection.name : '',
          builder: (context, name) => SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                name,
                style: textTheme.titleLarge,
              ),
            ),
          ),
        ),
        SliverSafeArea(
          sliver: BlocBuilder<FindCollectionDetailsCubit, FindCollectionDetailsState>(
            builder: (context, state) {
              if (state is! FindCollectionDetailsSuccess) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return MultiSliver(
                children: [
                  for (final family in state.filteredFamilies) ...[
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
                              collectionId: state.originalCollection.id,
                              canEdit: state.originalCollection.canEdit,
                            );
                          },
                        ),
                      ),
                    ]
                  ]
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

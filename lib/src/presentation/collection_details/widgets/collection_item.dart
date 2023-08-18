import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../routes/app_router.dart';

class CollectionItem extends StatelessWidget {
  final CollectionCoinWithTemplate item;
  final String family;
  final String group;
  final String collectionId;
  final bool canEdit;

  const CollectionItem({
    super.key,
    required this.item,
    required this.family,
    required this.group,
    required this.collectionId,
    required this.canEdit,
  });

  void onTapItem(BuildContext context) => context.router.push(
        CoinDetailsRoute(
          item: item,
          family: family,
          group: group,
          collectionId: collectionId,
          canEdit: canEdit,
        ),
      );

  @override
  Widget build(BuildContext context) {
    const imageSize = 56.0;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: InkWell(
        onTap: () => onTapItem(context),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              item.photos.isNotEmpty
                  ? Image.network(
                      item.photos.first,
                      width: imageSize,
                      height: imageSize,
                    )
                  : const Icon(
                      Icons.monetization_on_outlined,
                      size: imageSize,
                    ),
              const SizedBox(height: 8),
              Text(
                item.name,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

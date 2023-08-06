import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class CollectionItem extends StatelessWidget {
  final CollectionCoinWithTemplate item;

  const CollectionItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    const imageSize = 48.0;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
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
          ),
        ],
      ),
    );
  }
}

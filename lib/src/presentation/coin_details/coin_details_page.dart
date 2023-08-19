import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../../shared/widgets/carousel/custom_carousel.dart';
import '../../utils/localizations.dart';
import '../../utils/preservation_to_localized_text.dart';
import 'widgets/add_coin_to_collection/add_coin_to_collection.dart';
import 'widgets/remove_coin_from_collection/remove_coin_from_collection.dart';
import 'widgets/value_with_label.dart';

@RoutePage()
class CoinDetailsPage extends StatelessWidget {
  final CollectionCoinWithTemplate item;
  final String family;
  final String group;
  final String collectionId;
  final bool canEdit;

  const CoinDetailsPage({
    super.key,
    required this.item,
    required this.family,
    required this.group,
    required this.collectionId,
    required this.canEdit,
  });

  void _onTapAdd(BuildContext context) => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 2 / 3),
        builder: (context) => AddCoinToCollection(
          coinId: item.id,
          collectionId: collectionId,
        ),
      );

  void _onTapRemove(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => RemoveCoinFromCollection(
          coin: CollectionCoin(
            photos: item.photos,
            coinId: item.id,
            preservation: item.preservation,
          ),
          collectionId: collectionId,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.height / 3;

    final strings = context.strings;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings.coinDetails,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            item.photos.isNotEmpty
                ? CustomCarousel(
                    images: item.photos,
                    imageHeight: imageSize,
                  )
                : Icon(
                    Icons.monetization_on_outlined,
                    size: imageSize,
                  ),
            const SizedBox(height: 8),
            ValueWithLabel(
              label: Text('${strings.coin}:'),
              value: item.name,
            ),
            const SizedBox(height: 8),
            ValueWithLabel(
              label: Text('${strings.family}:'),
              value: family,
            ),
            const SizedBox(height: 8),
            ValueWithLabel(
              label: Text('${strings.group}:'),
              value: group,
            ),
            if (item.isRare) ...[
              const SizedBox(height: 8),
              ValueWithLabel(
                label: const Icon(Icons.star),
                value: strings.isRare,
              ),
            ],
            if (item.preservation != Preservation.unknown) ...[
              const SizedBox(height: 8),
              ValueWithLabel(
                label: Text('${strings.preservation}:'),
                value: item.preservation.toLocalizedString(context),
              ),
            ],
            if (canEdit) ...[
              const SizedBox(height: 8),
              if (item.inCollection)
                OutlinedButton.icon(
                  onPressed: () => _onTapRemove(context),
                  label: Text(strings.removeCoinFromCollection),
                  icon: const Icon(Icons.remove_circle_outline),
                )
              else
                FilledButton.icon(
                  icon: const Icon(Icons.add),
                  label: Text(strings.addCoinToCollection),
                  onPressed: () => _onTapAdd(context),
                ),
            ]
          ],
        ),
      ),
    );
  }
}

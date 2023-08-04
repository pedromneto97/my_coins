import '../data/data.dart';
import '../entities/entities.dart';

class FindCollectionUseCase {
  final CollectionProvider _collectionProvider;
  final TemplateProvider _templateProvider;

  const FindCollectionUseCase({
    required CollectionProvider collectionProvider,
    required TemplateProvider templateProvider,
  })  : _collectionProvider = collectionProvider,
        _templateProvider = templateProvider;

  Future<CollectionWithTemplate> call(String id) async {
    final collection = await _collectionProvider.findCollection(id);
    final template = await _templateProvider.findTemplate(collection.templateId);

    return CollectionWithTemplate(
      id: collection.id,
      name: collection.name,
      canEdit: collection.canEdit,
      isPublic: collection.isPublic,
      coinFamily: _mapToCollectionCoinFamily(
        collection.coins,
        template.coinFamily,
      ),
    );
  }

  List<CollectionCoinFamily> _mapToCollectionCoinFamily(
    List<CollectionCoin> collectionCoins,
    List<CoinFamily> coinFamilies,
  ) {
    final coinFamily = <CollectionCoinFamily>[];
    for (final family in coinFamilies) {
      coinFamily.add(
        CollectionCoinFamily(
          name: family.name,
          coinGroup: _mapToCollectionCoinGroup(
            collectionCoins,
            family.coinGroup,
          ),
        ),
      );
    }

    return coinFamily;
  }

  List<CollectionCoinGroup> _mapToCollectionCoinGroup(
    List<CollectionCoin> collectionCoins,
    List<CoinGroup> coinGroups,
  ) {
    final collectionCoinGroups = <CollectionCoinGroup>[];
    for (final group in coinGroups) {
      collectionCoinGroups.add(
        CollectionCoinGroup(
          name: group.name,
          coins: _mapToCollectionCoinWithTemplate(collectionCoins, group.coins),
        ),
      );
    }

    return collectionCoinGroups;
  }

  List<CollectionCoinWithTemplate> _mapToCollectionCoinWithTemplate(
    List<CollectionCoin> collectionCoins,
    List<Coin> coins,
  ) {
    final collectionCoinsWithTemplate = <CollectionCoinWithTemplate>[];
    for (final coin in coins) {
      final collectionCoin = collectionCoins.firstWhere((element) => element.coinId == coin.id);

      collectionCoinsWithTemplate.add(
        CollectionCoinWithTemplate(
          id: coin.id,
          name: coin.name,
          isRare: coin.isRare,
          photos: collectionCoin.photos,
        ),
      );
    }

    return collectionCoinsWithTemplate;
  }
}

import '../../entities/entities.dart';

abstract interface class CollectionProvider {
  const CollectionProvider();

  Future<List<Collection>> getPublicCollections();

  Future<List<Collection>> getUserCollections();

  Future<CollectionWithTemplate> findCollection(String id);

  Future<CollectionCoin> addCoinToCollection({
    required String collectionId,
    required CollectionCoin coin,
  });

  Future<void> removeCoinFromCollection({
    required String collectionId,
    required String coinId,
  });

  Future<Collection> createCollection(Collection collection);

  Future<Collection> updateCollection(Collection collection);

  Future<void> deleteCollection(String id);
}

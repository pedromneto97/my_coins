import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/domain.dart';
import 'models/collection_coin_model.dart';
import 'models/collection_model.dart';

class CollectionProviderImpl implements CollectionProvider {
  late final CollectionReference<CollectionModel> _collectionReference;
  final FirebaseAuth _firebaseAuth;
  final CrashlyticsProvider _crashlytics;

  CollectionProviderImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required CrashlyticsProvider crashlytics,
  })  : _firebaseAuth = firebaseAuth,
        _crashlytics = crashlytics {
    _collectionReference = firestore.collection('collections').withConverter(
          fromFirestore: CollectionModel.fromFirebase,
          toFirestore: (value, options) => value.toJson(),
        );
  }

  String get _currentUserId => _firebaseAuth.currentUser!.uid;

  @override
  Future<CollectionCoin> addCoinToCollection({required String collectionId, required CollectionCoin coin}) async {
    try {
      final model = CollectionCoinModel.fromEntity(coin);

      await _collectionReference.doc(collectionId).update({
        'coins': FieldValue.arrayUnion([model.toJson()]),
      });

      return coin;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to add coin to collection',
      );

      throw const FailedToAddCoinToCollectionException();
    }
  }

  @override
  Future<Collection> createCollection(Collection collection) async {
    try {
      final model = CollectionModel.fromEntity(
        collection,
        _currentUserId,
      );
      final snapshot = await _collectionReference.add(model);

      final data = await snapshot.get();

      return data.data()!.toEntity(_currentUserId);
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to create collection',
      );

      throw const FailedToCreateCollectionException();
    }
  }

  @override
  Future<void> deleteCollection(String id) async {
    try {
      await _collectionReference.doc(id).delete();
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to delete collection',
      );

      throw const FailedToDeleteCollectionException();
    }
  }

  @override
  Future<Collection> findCollection(String id) async {
    try {
      final collection = await _findCollection(id);

      return collection.toEntity(_currentUserId);
    } on MyCoinsException {
      rethrow;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to find collection with id: $id',
      );

      throw const CollectionNotFoundException();
    }
  }

  @override
  Future<List<Collection>> getPublicCollections() async {
    try {
      final snapshot = await _collectionReference
          .where(
            'isPublic',
            isEqualTo: true,
          )
          .get();

      final collections = <Collection>[];

      for (final doc in snapshot.docs) {
        collections.add(doc.data().toEntity(_currentUserId));
      }

      return collections;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to get public collections',
      );

      throw const FailedToGetPublicCollectionsException();
    }
  }

  @override
  Future<List<Collection>> getUserCollections() async {
    try {
      final snapshot = await _collectionReference
          .where(
            'userId',
            isEqualTo: _currentUserId,
          )
          .get();

      final collections = <Collection>[];

      for (final doc in snapshot.docs) {
        collections.add(doc.data().toEntity(_currentUserId));
      }

      return collections;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to get user collections',
      );

      throw const FailedToGetUserCollectionsException();
    }
  }

  @override
  Future<void> removeCoinFromCollection({
    required String collectionId,
    required String coinId,
  }) async {
    try {
      final collection = await _findCollection(collectionId);

      final coins = <Map<String, dynamic>>[];
      for (final coin in collection.coins) {
        if (coin.coinId != coinId) {
          coins.add(coin.toJson());
        }
      }

      await _collectionReference.doc(collectionId).update({
        'coins': coins,
      });
    } on MyCoinsException {
      rethrow;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to remove coin from collection',
      );

      throw const FailedToRemoveCoinFromCollectionException();
    }
  }

  @override
  Future<Collection> updateCollection(Collection collection) async {
    try {
      final model = CollectionModel.fromEntity(
        collection,
        _currentUserId,
      );
      await _collectionReference.doc(collection.id).set(model);

      final snapshot = await _collectionReference.doc(collection.id).get();

      return snapshot.data()!.toEntity(_currentUserId);
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[CollectionProviderImpl] Failed to update collection',
      );

      throw const FailedToUpdateCollectionException();
    }
  }

  Future<CollectionModel> _findCollection(String id) async {
    final snapshot = await _collectionReference.doc(id).get();
    if (snapshot.exists) {
      return snapshot.data()!;
    }

    throw const CollectionNotFoundException();
  }
}

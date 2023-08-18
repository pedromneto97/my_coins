import 'dart:io';

import '../data/data.dart';
import '../entities/entities.dart';
import '../exceptions/exceptions.dart';

class AddCoinUseCase {
  final CollectionProvider _collectionProvider;
  final PhotoProvider _photosProvider;
  final CrashlyticsProvider _crashlyticsProvider;

  const AddCoinUseCase({
    required CollectionProvider collectionProvider,
    required PhotoProvider photosProvider,
    required CrashlyticsProvider crashlyticsProvider,
  })  : _collectionProvider = collectionProvider,
        _photosProvider = photosProvider,
        _crashlyticsProvider = crashlyticsProvider;

  Future<CollectionCoin> call({
    required String collectionId,
    required String coinId,
    required List<File> photos,
    required Preservation preservation,
  }) async {
    try {
      final photosUrls = await Future.wait([
        for (final photo in photos) _photosProvider.storePhoto(photo),
      ]);

      return _collectionProvider.addCoinToCollection(
        collectionId: collectionId,
        coin: CollectionCoin(
          coinId: coinId,
          photos: photosUrls,
          preservation: preservation,
        ),
      );
    } on MyCoinsException {
      rethrow;
    } catch (exception, stackTrace) {
      _crashlyticsProvider.recordError(
        exception,
        stackTrace,
        reason: '[AddCoinUseCase] Failed to add coin',
      );

      throw const FailedToAddCoinException();
    }
  }
}

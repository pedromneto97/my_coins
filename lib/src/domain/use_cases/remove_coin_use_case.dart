import '../data/data.dart';
import '../entities/collection/collection_coin.dart';
import '../exceptions/exceptions.dart';

class RemoveCoinUseCase {
  final CollectionProvider _collectionProvider;
  final PhotoProvider _photosProvider;
  final CrashlyticsProvider _crashlyticsProvider;

  const RemoveCoinUseCase({
    required CollectionProvider collectionProvider,
    required PhotoProvider photosProvider,
    required CrashlyticsProvider crashlyticsProvider,
  })  : _collectionProvider = collectionProvider,
        _photosProvider = photosProvider,
        _crashlyticsProvider = crashlyticsProvider;

  Future<void> call({
    required String collectionId,
    required CollectionCoin coin,
  }) async {
    try {
      await Future.wait([
        for (final photo in coin.photos) _photosProvider.deletePhoto(photo),
      ]);

      await _collectionProvider.removeCoinFromCollection(
        collectionId: collectionId,
        coinId: coin.coinId,
      );
    } on MyCoinsException {
      rethrow;
    } catch (exception, stackTrace) {
      _crashlyticsProvider.recordError(
        exception,
        stackTrace,
        reason: '[RemoveCoinUseCase] Failed to remove coin',
      );

      throw const FailedToRemoveCoinException();
    }
  }
}

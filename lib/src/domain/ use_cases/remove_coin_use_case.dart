import 'dart:developer';

import '../data/data.dart';
import '../entities/collection/collection_coin.dart';
import '../exceptions/exceptions.dart';

class RemoveCoinUseCase {
  final CollectionProvider _collectionProvider;
  final PhotoProvider _photosProvider;

  const RemoveCoinUseCase(
    this._collectionProvider,
    this._photosProvider,
  );

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
      log(
        exception.toString(),
        error: exception,
        stackTrace: stackTrace,
        time: DateTime.now(),
        name: 'RemoveCoinUseCase',
      );

      throw const FailedToRemoveCoinException();
    }
  }
}

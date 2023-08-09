import 'dart:developer';
import 'dart:io';

import '../data/providers/collection_provider.dart';
import '../data/providers/photo_provider.dart';
import '../entities/entities.dart';
import '../exceptions/exceptions.dart';

class AddCoinUseCase {
  final CollectionProvider _collectionProvider;
  final PhotoProvider _photosProvider;

  const AddCoinUseCase({
    required CollectionProvider collectionProvider,
    required PhotoProvider photosProvider,
  })  : _collectionProvider = collectionProvider,
        _photosProvider = photosProvider;

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
      log(
        exception.toString(),
        error: exception,
        stackTrace: stackTrace,
        time: DateTime.now(),
        name: 'AddCoinUseCase',
      );

      throw const FailedToAddCoinException();
    }
  }
}

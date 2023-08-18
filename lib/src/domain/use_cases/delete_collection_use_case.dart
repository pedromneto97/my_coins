import '../domain.dart';

class DeleteCollectionUseCase {
  final CollectionProvider _provider;
  final RemoveCoinUseCase _removeCoinUseCase;
  final CrashlyticsProvider _crashlytics;

  const DeleteCollectionUseCase({
    required CollectionProvider provider,
    required RemoveCoinUseCase removeCoinUseCase,
    required CrashlyticsProvider crashlytics,
  })  : _crashlytics = crashlytics,
        _provider = provider,
        _removeCoinUseCase = removeCoinUseCase;

  Future<void> call(Collection collection) async {
    try {
      await Future.wait([
        for (final coin in collection.coins)
          _removeCoinUseCase.call(
            collectionId: collection.id,
            coin: coin,
          ),
      ]);

      await _provider.deleteCollection(collection.id);
    } on MyCoinsException {
      rethrow;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[DeleteCollectionUseCase] Failed to delete collection',
      );
    }
  }
}

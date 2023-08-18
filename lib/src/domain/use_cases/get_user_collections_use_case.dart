import '../data/providers/collection_provider.dart';
import '../entities/entities.dart';

class GetUserCollectionsUseCase {
  final CollectionProvider _provider;

  GetUserCollectionsUseCase(this._provider);

  Future<List<Collection>> call() => _provider.getUserCollections();
}

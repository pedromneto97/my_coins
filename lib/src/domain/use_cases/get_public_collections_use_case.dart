import '../data/providers/collection_provider.dart';
import '../entities/entities.dart';

class GetPublicCollectionsUseCase {
  final CollectionProvider _provider;

  const GetPublicCollectionsUseCase(this._provider);

  Future<List<Collection>> call() => _provider.getPublicCollections();
}

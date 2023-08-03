import '../data/data.dart';
import '../entities/entities.dart';

class FindCollectionUseCase {
  final CollectionProvider _provider;

  const FindCollectionUseCase(this._provider);

  Future<CollectionWithTemplate> call(String id) => _provider.findCollection(id);
}

import '../data/data.dart';
import '../entities/entities.dart';

class UpdateCollectionUseCase {
  final CollectionProvider _provider;

  const UpdateCollectionUseCase({
    required CollectionProvider provider,
  }) : _provider = provider;

  Future<Collection> call(Collection collection) => _provider.updateCollection(collection);
}

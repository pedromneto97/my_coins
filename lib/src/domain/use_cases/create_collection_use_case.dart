import '../data/providers/collection_provider.dart';
import '../entities/entities.dart';

class CreateCollectionUseCase {
  final CollectionProvider _provider;

  const CreateCollectionUseCase(this._provider);

  Future<Collection> call({
    required String name,
    required String templateId,
    required bool isPublic,
  }) =>
      _provider.createCollection(
        Collection(
          name: name,
          templateId: templateId,
          isPublic: isPublic,
          canEdit: true,
          coins: const [],
          id: '',
        ),
      );
}

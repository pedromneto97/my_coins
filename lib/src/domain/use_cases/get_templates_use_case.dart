import '../data/data.dart';
import '../entities/entities.dart';

class GetTemplatesUseCase {
  final TemplateProvider _templateProvider;

  const GetTemplatesUseCase({
    required TemplateProvider templateProvider,
  }) : _templateProvider = templateProvider;

  Future<List<CollectionTemplate>> call() => _templateProvider.getCollectionTemplates();
}

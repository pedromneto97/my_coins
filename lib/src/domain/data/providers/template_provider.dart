import '../../entities/entities.dart';

abstract interface class TemplateProvider {
  const TemplateProvider();

  Future<CollectionTemplate> findTemplate(String id);

  Future<List<CollectionTemplate>> getCollectionTemplates();
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/domain.dart';
import 'models/collection_template_model.dart';

class TemplateProviderImpl implements TemplateProvider {
  late final CollectionReference<CollectionTemplateModel> _templateReference;
  final CrashlyticsProvider _crashlytics;

  TemplateProviderImpl({
    required FirebaseFirestore firestore,
    required CrashlyticsProvider crashlytics,
  }) : _crashlytics = crashlytics {
    _templateReference = firestore.collection('templates').withConverter(
          fromFirestore: CollectionTemplateModel.fromJson,
          toFirestore: (value, options) => value.toJson(),
        );
  }

  @override
  Future<CollectionTemplate> findTemplate(String id) async {
    try {
      final snapshot = await _templateReference.doc(id).get();
      if (snapshot.exists) {
        return snapshot.data()!.toEntity();
      }

      throw const TemplateNotFoundException();
    } on MyCoinsException {
      rethrow;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[TemplateProviderImpl] Failed to find template',
      );

      throw const TemplateNotFoundException();
    }
  }

  @override
  Future<List<CollectionTemplate>> getCollectionTemplates() async {
    try {
      final snapshot = await _templateReference.get();

      final templates = <CollectionTemplate>[];

      for (final doc in snapshot.docs) {
        templates.add(doc.data().toEntity());
      }

      return templates;
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[TemplateProviderImpl] Failed to get templates',
      );

      throw const FailedToGetTemplatesException();
    }
  }
}

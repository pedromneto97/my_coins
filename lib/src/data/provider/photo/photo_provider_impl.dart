import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/domain.dart';

class PhotoProviderImpl implements PhotoProvider {
  final FirebaseStorage _storage;
  final Uuid _uuid;
  final CrashlyticsProvider _crashlytics;

  const PhotoProviderImpl({
    required FirebaseStorage storage,
    required Uuid uuid,
    required CrashlyticsProvider crashlytics,
  })  : _uuid = uuid,
        _storage = storage,
        _crashlytics = crashlytics;

  @override
  Future<void> deletePhoto(String url) async {
    try {
      final ref = _storage.refFromURL(url);

      await ref.delete();
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[PhotoProviderImpl] Failed to delete photo',
      );

      throw const FailedToDeletePhotoException();
    }
  }

  @override
  Future<String> storePhoto(File file) async {
    try {
      final extension = _getExtensionFromFile(file);
      final ref = _storage.ref().child('photos/${_uuid.v4()}.$extension');

      final snapshot = await ref.putFile(file);

      return await snapshot.ref.getDownloadURL();
    } catch (exception, stackTrace) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: '[PhotoProviderImpl] Failed to store photo',
      );

      throw const FailedToStorePhotoException();
    }
  }

  String _getExtensionFromFile(File file) {
    final path = file.path;

    final dotIndex = path.lastIndexOf('.');

    return path.substring(dotIndex + 1);
  }
}

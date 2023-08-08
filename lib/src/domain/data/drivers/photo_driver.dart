import 'dart:io';

abstract interface class PhotoDriver {
  const PhotoDriver();

  Future<List<File>> pickPhotosFromGallery();

  Future<File> takePhoto();
}

import 'dart:io';

abstract interface class PhotoDriver {
  const PhotoDriver();

  Future<File> pickPhotoFromGallery();

  Future<File> takePhoto();
}

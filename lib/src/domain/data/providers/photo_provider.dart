import 'dart:io';

abstract interface class PhotoProvider {
  const PhotoProvider();

  Future<String> storePhoto(File file);

  Future<void> deletePhoto(String url);
}

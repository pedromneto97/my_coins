import 'dart:io';

import '../data/data.dart';

class PickPhotosUseCase {
  final PhotoDriver _driver;

  const PickPhotosUseCase({
    required PhotoDriver driver,
  }) : _driver = driver;

  Future<List<File>> call() => _driver.pickPhotosFromGallery();
}

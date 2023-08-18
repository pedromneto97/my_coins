import 'dart:io';

import '../data/data.dart';

class TakePhotoUseCase {
  final PhotoDriver _driver;

  const TakePhotoUseCase({
    required PhotoDriver driver,
  }) : _driver = driver;

  Future<File> call() => _driver.takePhoto();
}

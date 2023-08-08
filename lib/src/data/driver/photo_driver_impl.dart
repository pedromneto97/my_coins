import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../domain/domain.dart';

class PhotoDriverImpl implements PhotoDriver {
  final ImagePicker _picker;

  const PhotoDriverImpl({
    required ImagePicker picker,
  }) : _picker = picker;

  @override
  Future<List<File>> pickPhotosFromGallery() async {
    try {
      final images = await _picker.pickMultiImage(
        imageQuality: 85,
        requestFullMetadata: false,
      );
      final files = <File>[
        for (final image in images) File(image.path),
      ];

      return files;
    } catch (exception, stackTrace) {
      log(
        'Failed to get photos from gallery',
        error: exception,
        stackTrace: stackTrace,
        time: DateTime.now(),
        name: 'PhotoDriverImpl',
      );
      throw const FailedToGetPhotosException();
    }
  }

  @override
  Future<File> takePhoto() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        requestFullMetadata: false,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (image == null) throw const UserCancelledPhotoException();

      return File(image.path);
    } catch (exception, stackTrace) {
      log(
        'Failed to get photos from gallery',
        error: exception,
        stackTrace: stackTrace,
        time: DateTime.now(),
        name: 'PhotoDriverImpl',
      );
      throw const FailedToTakePhotoException();
    }
  }
}

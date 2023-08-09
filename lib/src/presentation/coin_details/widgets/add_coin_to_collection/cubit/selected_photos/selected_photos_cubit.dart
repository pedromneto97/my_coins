import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/domain.dart';

class SelectedPhotosCubit extends Cubit<List<File>> {
  final PickPhotosUseCase _pickPhotosUseCase;
  final TakePhotoUseCase _takePhotoUseCase;

  SelectedPhotosCubit({
    required PickPhotosUseCase pickPhotosUseCase,
    required TakePhotoUseCase takePhotoUseCase,
  })  : _takePhotoUseCase = takePhotoUseCase,
        _pickPhotosUseCase = pickPhotosUseCase,
        super([]);

  Future<void> takePhoto() async {
    try {
      final photo = await _takePhotoUseCase.call();
      final newPhotos = [...state, photo];

      emit(newPhotos);
    } catch (_) {}
  }

  Future<void> pickPhotos() async {
    try {
      final photos = await _pickPhotosUseCase.call();
      final newPhotos = [...state, ...photos];

      emit(newPhotos);
    } catch (_) {}
  }

  void removePhoto(File photo) {
    final newPhotos = [...state]..remove(photo);

    emit(newPhotos);
  }
}

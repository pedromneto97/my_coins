import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upsert_collection_state.dart';

abstract class UpsertCollectionCubit extends Cubit<UpsertCollectionState> {
  UpsertCollectionCubit() : super(const UpsertCollectionInitial());

  @protected
  Future<void> callUseCase({
    required String templateId,
    required String name,
    required bool isPublic,
  });

  Future<void> upsertCollection({
    required String templateId,
    required String name,
    required bool isPublic,
  }) async {
    emit(const UpsertCollectionLoading());
    try {
      await callUseCase(
        templateId: templateId,
        name: name,
        isPublic: isPublic,
      );

      emit(const UpsertCollectionSuccess());
    } catch (e) {
      emit(const UpsertCollectionError());
    }
  }
}

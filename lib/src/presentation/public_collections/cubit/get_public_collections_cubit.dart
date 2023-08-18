import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'get_public_collections_state.dart';

class GetPublicCollectionsCubit extends Cubit<GetPublicCollectionsState> {
  final GetPublicCollectionsUseCase _useCase;

  GetPublicCollectionsCubit({
    required GetPublicCollectionsUseCase useCase,
  })  : _useCase = useCase,
        super(const GetPublicCollectionsInitial());

  Future<void> load() async {
    emit(const GetPublicCollectionsLoading());

    try {
      final collections = await _useCase();

      if (collections.isEmpty) {
        emit(const GetPublicCollectionsEmpty());
        return;
      }

      emit(GetPublicCollectionsLoaded(collections: collections));
    } catch (_) {
      emit(const GetPublicCollectionsError());
    }
  }
}

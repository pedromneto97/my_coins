import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/domain.dart';

part 'get_user_collections_state.dart';

class GetUserCollectionsCubit extends Cubit<GetUserCollectionsState> {
  final GetUserCollectionsUseCase _useCase;

  GetUserCollectionsCubit({
    required GetUserCollectionsUseCase useCase,
  })  : _useCase = useCase,
        super(const GetUserCollectionsInitial());

  Future<void> getUserCollections() async {
    emit(const GetUserCollectionsLoading());
    try {
      final collections = await _useCase();

      emit(
        GetUserCollectionsLoaded(collections: collections),
      );
    } catch (_) {
      emit(const GetUserCollectionsError());
    }
  }
}

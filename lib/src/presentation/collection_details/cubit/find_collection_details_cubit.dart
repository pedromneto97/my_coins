import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'find_collection_details_state.dart';

class FindCollectionDetailsCubit extends Cubit<FindCollectionDetailsState> {
  final String _id;
  final FindCollectionUseCase _useCase;

  FindCollectionDetailsCubit({
    required String id,
    required FindCollectionUseCase useCase,
  })  : _useCase = useCase,
        _id = id,
        super(const FindCollectionDetailsInitial());

  Future<void> loadCollectionDetails() async {
    emit(const FindCollectionDetailsLoading());
    try {
      final collection = await _useCase.call(_id);

      emit(FindCollectionDetailsSuccess(collection: collection));
    } catch (e) {
      emit(const FindCollectionDetailsFailure());
    }
  }
}

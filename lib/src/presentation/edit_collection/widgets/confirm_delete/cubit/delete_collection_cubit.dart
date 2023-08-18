import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/domain.dart';
import '../../../../../shared/event_bus/event_bus.dart';
import '../../../../../shared/event_bus/events/collection_events.dart';

part 'delete_collection_state.dart';

class DeleteCollectionCubit extends Cubit<DeleteCollectionState> {
  final DeleteCollectionUseCase _useCase;
  final Collection _collection;

  DeleteCollectionCubit({
    required DeleteCollectionUseCase useCase,
    required Collection collection,
  })  : _collection = collection,
        _useCase = useCase,
        super(const DeleteCollectionInitial());

  Future<void> deleteCollection() async {
    emit(const DeleteCollectionLoading());
    try {
      await _useCase.call(_collection);

      EventBus.I.fire(CollectionDeletedEvent(_collection));
      emit(const DeleteCollectionSuccess());
    } catch (e) {
      emit(const DeleteCollectionFailure());
    }
  }
}

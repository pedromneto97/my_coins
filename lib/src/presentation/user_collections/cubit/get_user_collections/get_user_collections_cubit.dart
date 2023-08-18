import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/domain.dart';
import '../../../../shared/event_bus/event_bus.dart';
import '../../../../shared/event_bus/events/collection_updated_event.dart';

part 'get_user_collections_state.dart';

class GetUserCollectionsCubit extends Cubit<GetUserCollectionsState> {
  final GetUserCollectionsUseCase _useCase;
  late final StreamSubscription _subscription;

  GetUserCollectionsCubit({
    required GetUserCollectionsUseCase useCase,
  })  : _useCase = useCase,
        super(const GetUserCollectionsInitial()) {
    _subscription = EventBus.I.listen<CollectionUpdatedEvent>(
      (event) => _updateCollection(event.collection),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }

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

  void _updateCollection(Collection collection) {
    final state = this.state;
    if (state is GetUserCollectionsLoaded) {
      final collections = [...state.collections];
      final index = collections.indexWhere((element) => element.id == collection.id);
      if (index != -1) {
        collections[index] = collection;
        emit(GetUserCollectionsLoaded(collections: collections));
      }
    }
  }
}

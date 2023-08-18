import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/domain.dart';
import '../../../../shared/event_bus/event_bus.dart';
import '../../../../shared/event_bus/events/collection_events.dart';

part 'get_user_collections_state.dart';

class GetUserCollectionsCubit extends Cubit<GetUserCollectionsState> {
  final GetUserCollectionsUseCase _useCase;
  late final StreamSubscription _subscription;

  GetUserCollectionsCubit({
    required GetUserCollectionsUseCase useCase,
  })  : _useCase = useCase,
        super(const GetUserCollectionsInitial()) {
    _subscription = EventBus.I.listen<CollectionEvents>(
      (event) => switch (event) {
        CollectionUpdatedEvent(collection: final collection) => _updateCollection(collection),
        CollectionDeletedEvent(collection: final collection) => _removeCollection(collection),
        CollectionCreatedEvent(collection: final collection) => _addCollection(collection),
        CollectionEvents() => null,
      },
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

      if (collections.isEmpty) {
        return emit(const EmptyUserCollections());
      }

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

  void _removeCollection(Collection collection) {
    final state = this.state;
    if (state is GetUserCollectionsLoaded) {
      final collections = [...state.collections];
      final index = collections.indexWhere((element) => element.id == collection.id);
      if (index != -1) {
        collections.removeAt(index);

        emit(
          collections.isEmpty ? const EmptyUserCollections() : GetUserCollectionsLoaded(collections: collections),
        );
      }
    }
  }

  void _addCollection(Collection collection) {
    final state = this.state;
    if (state is GetUserCollectionsLoaded) {
      final collections = [...state.collections];
      collections.add(collection);
      emit(GetUserCollectionsLoaded(collections: collections));
    } else if (state is EmptyUserCollections) {
      emit(GetUserCollectionsLoaded(collections: [collection]));
    }
  }
}

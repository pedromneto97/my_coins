import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../../shared/event_bus/event_bus.dart';
import '../../../shared/event_bus/events/base_event.dart';
import '../../../shared/event_bus/events/coin_added_event.dart';
import '../../../shared/event_bus/events/coin_removed_event.dart';
import '../../../shared/event_bus/events/collection_events.dart';

part 'find_collection_details_state.dart';

class FindCollectionDetailsCubit extends Cubit<FindCollectionDetailsState> {
  final String _id;
  final FindCollectionUseCase _useCase;

  late StreamSubscription _subscription;

  FindCollectionDetailsCubit({
    required String id,
    required FindCollectionUseCase useCase,
  })  : _useCase = useCase,
        _id = id,
        super(const FindCollectionDetailsInitial()) {
    _subscription = EventBus.I.listen<BaseEvent>(
      (event) => switch (event) {
        CoinAddedEvent() => loadCollectionDetails(),
        CoinRemovedEvent() => loadCollectionDetails(),
        CollectionUpdatedEvent(collection: final collection) => _updateCollection(collection),
        BaseEvent() => null,
      },
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }

  Future<void> loadCollectionDetails() async {
    emit(const FindCollectionDetailsLoading());
    try {
      final collection = await _useCase.call(_id);

      emit(FindCollectionDetailsSuccess(collection: collection));
    } catch (e) {
      emit(const FindCollectionDetailsFailure());
    }
  }

  void _updateCollection(Collection collection) {
    final state = this.state;
    if (state is FindCollectionDetailsSuccess) {
      emit(
        FindCollectionDetailsSuccess(
          collection: state.collection.copyWith(
            name: collection.name,
            isPublic: collection.isPublic,
          ),
        ),
      );
    }
  }
}

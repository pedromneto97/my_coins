import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../../shared/event_bus/event_bus.dart';
import '../../../shared/event_bus/events/base_event.dart';
import '../../../shared/event_bus/events/coin_added_event.dart';
import '../../../shared/event_bus/events/coin_removed_event.dart';
import '../../../shared/event_bus/events/collection_events.dart';
import 'filter.dart';

part 'find_collection_details_state.dart';

typedef _FilterCoinFunction = bool Function(CollectionCoinWithTemplate coin);

class FindCollectionDetailsCubit extends Cubit<FindCollectionDetailsState> {
  final String _id;
  final FindCollectionUseCase _useCase;
  late StreamSubscription _subscription;
  Filter _filter = Filter.all;

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

  Filter get filter => _filter;

  Future<void> loadCollectionDetails() async {
    emit(const FindCollectionDetailsLoading());
    try {
      _filter = Filter.all;
      final collection = await _useCase.call(_id);

      emit(
        FindCollectionDetailsSuccess(
          originalCollection: collection,
          filteredFamilies: collection.coinFamily,
        ),
      );
    } catch (e) {
      emit(const FindCollectionDetailsFailure());
    }
  }

  void _updateCollection(Collection collection) {
    final state = this.state;
    if (state is FindCollectionDetailsSuccess) {
      emit(
        state.copyWith(
          originalCollection: state.originalCollection.copyWith(
            name: collection.name,
            isPublic: collection.isPublic,
          ),
        ),
      );
    }
  }

  void filterCollection(Filter filter) {
    _filter = filter;
    final state = this.state;
    if (state is FindCollectionDetailsSuccess) {
      emit(
        state.copyWith(
          filteredFamilies: _filterCoinFamily(state.originalCollection.coinFamily),
        ),
      );
    }
  }

  List<CollectionCoinFamily> _filterCoinFamily(List<CollectionCoinFamily> coinFamily) {
    switch (_filter) {
      case Filter.all:
        return coinFamily;
      case Filter.missing:
        return _filterCoinFamilies(
          coinFamily,
          (coin) => !coin.inCollection,
        );
      case Filter.rare:
        return _filterCoinFamilies(
          coinFamily,
          (coin) => coin.isRare,
        );
    }
  }

  List<CollectionCoinFamily> _filterCoinFamilies(List<CollectionCoinFamily> families, _FilterCoinFunction filter) {
    final filteredFamilies = <CollectionCoinFamily>[];
    for (final family in families) {
      final filteredGroups = _filterCoinGroups(family.coinGroup, filter);
      if (filteredGroups.isNotEmpty) {
        filteredFamilies.add(family.copyWith(coinGroup: filteredGroups));
      }
    }

    return filteredFamilies;
  }

  List<CollectionCoinGroup> _filterCoinGroups(List<CollectionCoinGroup> groups, _FilterCoinFunction filter) {
    final filteredGroups = <CollectionCoinGroup>[];
    for (final group in groups) {
      final filteredCoins = _filterCoins(group.coins, filter);
      if (filteredCoins.isNotEmpty) {
        filteredGroups.add(group.copyWith(coins: filteredCoins));
      }
    }

    return filteredGroups;
  }

  List<CollectionCoinWithTemplate> _filterCoins(List<CollectionCoinWithTemplate> coins, _FilterCoinFunction filter) {
    final filteredCoins = <CollectionCoinWithTemplate>[];
    for (final coin in coins) {
      if (filter(coin)) {
        filteredCoins.add(coin);
      }
    }

    return filteredCoins;
  }
}

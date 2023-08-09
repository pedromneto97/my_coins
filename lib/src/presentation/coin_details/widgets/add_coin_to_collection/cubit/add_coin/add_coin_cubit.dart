import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/domain.dart';
import '../../../../../../shared/event_bus/event_bus.dart';
import '../../../../../../shared/event_bus/events/coin_added_event.dart';

part 'add_coin_state.dart';

class AddCoinCubit extends Cubit<AddCoinState> {
  final AddCoinUseCase _useCase;
  final String _collectionId;
  final String _coinId;

  AddCoinCubit({
    required AddCoinUseCase useCase,
    required String collectionId,
    required String coinId,
  })  : _coinId = coinId,
        _collectionId = collectionId,
        _useCase = useCase,
        super(const AddCoinInitial());

  Future<void> addCoin({
    required List<File> photos,
    required Preservation preservation,
  }) async {
    emit(const AddCoinLoading());

    try {
      final coin = await _useCase(
        coinId: _coinId,
        collectionId: _collectionId,
        photos: photos,
        preservation: preservation,
      );

      emit(const AddCoinSuccess());

      EventBus.I.fire(
        CoinAddedEvent(coin),
      );
    } catch (_) {
      emit(const AddCoinError());
    }
  }
}

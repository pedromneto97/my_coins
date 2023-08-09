import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/domain.dart';
import '../../../../../shared/event_bus/event_bus.dart';
import '../../../../../shared/event_bus/events/coin_removed_event.dart';

part 'remove_coin_state.dart';

class RemoveCoinCubit extends Cubit<RemoveCoinState> {
  final RemoveCoinUseCase _useCase;
  final CollectionCoin _coin;
  final String _collectionId;

  RemoveCoinCubit({
    required RemoveCoinUseCase useCase,
    required CollectionCoin coin,
    required String collectionId,
  })  : _useCase = useCase,
        _coin = coin,
        _collectionId = collectionId,
        super(const RemoveCoinInitial());

  Future<void> removeCoin() async {
    emit(const RemoveCoinLoading());

    try {
      await _useCase(
        coin: _coin,
        collectionId: _collectionId,
      );

      emit(const RemoveCoinSuccess());

      EventBus.I.fire(const CoinRemovedEvent());
    } catch (e) {
      emit(const RemoveCoinError());
    }
  }
}

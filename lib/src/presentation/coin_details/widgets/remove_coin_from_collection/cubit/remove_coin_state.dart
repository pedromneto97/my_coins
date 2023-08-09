part of 'remove_coin_cubit.dart';

abstract class RemoveCoinState extends Equatable {
  const RemoveCoinState();

  @override
  List<Object> get props => [];
}

class RemoveCoinInitial extends RemoveCoinState {
  const RemoveCoinInitial();
}

class RemoveCoinLoading extends RemoveCoinState {
  const RemoveCoinLoading();
}

class RemoveCoinSuccess extends RemoveCoinState {
  const RemoveCoinSuccess();
}

class RemoveCoinError extends RemoveCoinState {
  const RemoveCoinError();
}

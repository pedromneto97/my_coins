part of 'add_coin_cubit.dart';

abstract class AddCoinState extends Equatable {
  const AddCoinState();

  @override
  List<Object> get props => [];
}

class AddCoinInitial extends AddCoinState {
  const AddCoinInitial();
}

class AddCoinLoading extends AddCoinState {
  const AddCoinLoading();
}

class AddCoinSuccess extends AddCoinState {
  const AddCoinSuccess();
}

class AddCoinError extends AddCoinState {
  const AddCoinError();
}

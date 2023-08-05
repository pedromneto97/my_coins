part of 'upsert_collection_cubit.dart';

abstract class UpsertCollectionState extends Equatable {
  const UpsertCollectionState();

  @override
  List<Object> get props => [];
}

class UpsertCollectionInitial extends UpsertCollectionState {
  const UpsertCollectionInitial();
}

class UpsertCollectionLoading extends UpsertCollectionState {
  const UpsertCollectionLoading();
}

class UpsertCollectionSuccess extends UpsertCollectionState {
  const UpsertCollectionSuccess();
}

class UpsertCollectionError extends UpsertCollectionState {
  const UpsertCollectionError();
}

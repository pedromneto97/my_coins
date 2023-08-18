part of 'delete_collection_cubit.dart';

abstract class DeleteCollectionState extends Equatable {
  const DeleteCollectionState();

  @override
  List<Object> get props => [];
}

class DeleteCollectionInitial extends DeleteCollectionState {
  const DeleteCollectionInitial();
}

class DeleteCollectionLoading extends DeleteCollectionState {
  const DeleteCollectionLoading();
}

class DeleteCollectionSuccess extends DeleteCollectionState {
  const DeleteCollectionSuccess();
}

class DeleteCollectionFailure extends DeleteCollectionState {
  const DeleteCollectionFailure();
}

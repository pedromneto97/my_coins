part of 'get_user_collections_cubit.dart';

abstract class GetUserCollectionsState extends Equatable {
  const GetUserCollectionsState();

  @override
  List<Object> get props => [];
}

class GetUserCollectionsInitial extends GetUserCollectionsState {
  const GetUserCollectionsInitial();
}

class GetUserCollectionsLoading extends GetUserCollectionsState {
  const GetUserCollectionsLoading();
}

class GetUserCollectionsLoaded extends GetUserCollectionsState {
  final List<Collection> collections;

  const GetUserCollectionsLoaded({
    required this.collections,
  });

  @override
  List<Object> get props => [collections];
}

class GetUserCollectionsError extends GetUserCollectionsState {
  const GetUserCollectionsError();
}

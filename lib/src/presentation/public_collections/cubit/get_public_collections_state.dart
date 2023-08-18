part of 'get_public_collections_cubit.dart';

abstract class GetPublicCollectionsState extends Equatable {
  const GetPublicCollectionsState();

  @override
  List<Object> get props => [];
}

class GetPublicCollectionsInitial extends GetPublicCollectionsState {
  const GetPublicCollectionsInitial();
}

class GetPublicCollectionsLoading extends GetPublicCollectionsState {
  const GetPublicCollectionsLoading();
}

class GetPublicCollectionsEmpty extends GetPublicCollectionsState {
  const GetPublicCollectionsEmpty();
}

class GetPublicCollectionsLoaded extends GetPublicCollectionsState {
  final List<Collection> collections;

  const GetPublicCollectionsLoaded({
    required this.collections,
  });

  @override
  List<Object> get props => [collections];
}

class GetPublicCollectionsError extends GetPublicCollectionsState {
  const GetPublicCollectionsError();
}

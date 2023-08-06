part of 'find_collection_details_cubit.dart';

abstract class FindCollectionDetailsState extends Equatable {
  const FindCollectionDetailsState();

  @override
  List<Object> get props => [];
}

class FindCollectionDetailsInitial extends FindCollectionDetailsState {
  const FindCollectionDetailsInitial();
}

class FindCollectionDetailsLoading extends FindCollectionDetailsState {
  const FindCollectionDetailsLoading();
}

class FindCollectionDetailsSuccess extends FindCollectionDetailsState {
  final CollectionWithTemplate collection;

  const FindCollectionDetailsSuccess({
    required this.collection,
  });

  @override
  List<Object> get props => [collection];
}

class FindCollectionDetailsFailure extends FindCollectionDetailsState {
  const FindCollectionDetailsFailure();
}

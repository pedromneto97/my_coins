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
  final CollectionWithTemplate originalCollection;
  final List<CollectionCoinFamily> filteredFamilies;

  const FindCollectionDetailsSuccess({
    required this.originalCollection,
    required this.filteredFamilies,
  });

  @override
  List<Object> get props => [originalCollection, filteredFamilies];

  FindCollectionDetailsState copyWith({
    CollectionWithTemplate? originalCollection,
    List<CollectionCoinFamily>? filteredFamilies,
  }) =>
      FindCollectionDetailsSuccess(
        originalCollection: originalCollection ?? this.originalCollection,
        filteredFamilies: filteredFamilies ?? this.filteredFamilies,
      );
}

class FindCollectionDetailsFailure extends FindCollectionDetailsState {
  const FindCollectionDetailsFailure();
}

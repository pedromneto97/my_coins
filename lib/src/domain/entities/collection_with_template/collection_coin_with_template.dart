import 'package:equatable/equatable.dart';

class CollectionCoinWithTemplate extends Equatable {
  final String id;
  final String name;
  final bool isRare;
  final List<String> photos;
  final bool inCollection;

  const CollectionCoinWithTemplate({
    required this.id,
    required this.name,
    required this.isRare,
    required this.photos,
    required this.inCollection,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isRare,
        photos,
        inCollection,
      ];
}

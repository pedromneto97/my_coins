import 'package:equatable/equatable.dart';

import '../collection/preservation.dart';

class CollectionCoinWithTemplate extends Equatable {
  final String id;
  final String name;
  final bool isRare;
  final List<String> photos;
  final bool inCollection;
  final Preservation preservation;

  const CollectionCoinWithTemplate({
    required this.id,
    required this.name,
    required this.isRare,
    required this.photos,
    required this.inCollection,
    required this.preservation,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isRare,
        photos,
        inCollection,
        preservation,
      ];
}

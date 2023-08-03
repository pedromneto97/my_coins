import 'package:equatable/equatable.dart';

class CollectionCoinWithTemplate extends Equatable {
  final String id;
  final String name;
  final bool isRare;
  final List<String> photos;

  const CollectionCoinWithTemplate({
    required this.id,
    required this.name,
    required this.isRare,
    required this.photos,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isRare,
        photos,
      ];
}

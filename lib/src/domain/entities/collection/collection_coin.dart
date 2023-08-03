import 'package:equatable/equatable.dart';

class CollectionCoin extends Equatable {
  final List<String> photos;
  final String coinId;

  const CollectionCoin({
    required this.photos,
    required this.coinId,
  });

  @override
  List<Object?> get props => [
        photos,
        coinId,
      ];
}

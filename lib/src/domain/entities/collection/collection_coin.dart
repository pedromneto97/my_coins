import 'package:equatable/equatable.dart';

import 'preservation.dart';

class CollectionCoin extends Equatable {
  final List<String> photos;
  final String coinId;
  final Preservation preservation;

  const CollectionCoin({
    required this.photos,
    required this.coinId,
    required this.preservation,
  });

  @override
  List<Object?> get props => [
        photos,
        coinId,
        preservation,
      ];
}

import 'package:equatable/equatable.dart';

import 'coin_family.dart';

class CollectionTemplate extends Equatable {
  final String id;
  final String defaultName;
  final List<CoinFamily> coinFamily;

  const CollectionTemplate({
    required this.id,
    required this.defaultName,
    required this.coinFamily,
  });

  @override
  List<Object?> get props => [id, defaultName, coinFamily];
}

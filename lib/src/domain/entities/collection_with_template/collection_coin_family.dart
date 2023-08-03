import 'package:equatable/equatable.dart';

import 'collection_coin_group.dart';

class CollectionCoinFamily extends Equatable {
  final String name;
  final List<CollectionCoinGroup> coinGroup;

  const CollectionCoinFamily({
    required this.name,
    required this.coinGroup,
  });

  @override
  List<Object?> get props => [name, coinGroup];
}

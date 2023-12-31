import 'package:equatable/equatable.dart';

import 'collection_coin_with_template.dart';

class CollectionCoinGroup extends Equatable {
  final String name;
  final List<CollectionCoinWithTemplate> coins;

  const CollectionCoinGroup({
    required this.name,
    required this.coins,
  });

  @override
  List<Object?> get props => [name, coins];

  CollectionCoinGroup copyWith({
    String? name,
    List<CollectionCoinWithTemplate>? coins,
  }) {
    return CollectionCoinGroup(
      name: name ?? this.name,
      coins: coins ?? this.coins,
    );
  }
}

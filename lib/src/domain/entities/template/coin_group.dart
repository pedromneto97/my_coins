import 'package:equatable/equatable.dart';

import 'coin.dart';

class CoinGroup extends Equatable {
  final String name;
  final bool isSpecial;
  final List<Coin> coins;

  const CoinGroup({
    required this.name,
    required this.isSpecial,
    required this.coins,
  });

  @override
  List<Object?> get props => [name, coins, isSpecial];
}

import 'package:equatable/equatable.dart';

import 'coin_group.dart';

class CoinFamily extends Equatable {
  final String name;
  final List<CoinGroup> coinGroup;

  const CoinFamily({
    required this.name,
    required this.coinGroup,
  });

  @override
  List<Object?> get props => [name, coinGroup];
}

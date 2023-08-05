import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/domain.dart';
import 'coin_model.dart';

part 'coin_group_model.g.dart';

@JsonSerializable()
class CoinGroupModel {
  final String name;
  final bool isSpecial;
  final List<CoinModel> coins;

  const CoinGroupModel({
    required this.name,
    required this.isSpecial,
    required this.coins,
  });

  factory CoinGroupModel.fromEntity(CoinGroup group) {
    final coinModelList = <CoinModel>[];
    for (final coin in group.coins) {
      coinModelList.add(CoinModel.fromEntity(coin));
    }

    return CoinGroupModel(
      name: group.name,
      isSpecial: group.isSpecial,
      coins: coinModelList,
    );
  }

  factory CoinGroupModel.fromJson(Map<String, dynamic> json) => _$CoinGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinGroupModelToJson(this);

  CoinGroup toEntity() {
    final coinsList = <Coin>[];
    for (final coin in coins) {
      coinsList.add(coin.toEntity());
    }

    return CoinGroup(
      name: name,
      isSpecial: isSpecial,
      coins: coinsList,
    );
  }
}

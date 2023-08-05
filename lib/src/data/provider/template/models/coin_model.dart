import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/domain.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  final String id;
  final String name;
  final bool isRare;

  const CoinModel({
    required this.id,
    required this.name,
    required this.isRare,
  });

  factory CoinModel.fromEntity(Coin coin) => CoinModel(
        id: coin.id,
        name: coin.name,
        isRare: coin.isRare,
      );

  factory CoinModel.fromJson(Map<String, dynamic> json) => _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelToJson(this);

  Coin toEntity() => Coin(
        id: id,
        name: name,
        isRare: isRare,
      );
}

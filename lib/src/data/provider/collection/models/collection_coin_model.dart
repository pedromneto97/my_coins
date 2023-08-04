import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/domain.dart';

part 'collection_coin_model.g.dart';

@JsonSerializable()
class CollectionCoinModel {
  final List<String> photos;
  final String coinId;

  const CollectionCoinModel({
    required this.photos,
    required this.coinId,
  });

  factory CollectionCoinModel.fromJson(Map<String, dynamic> json) => _$CollectionCoinModelFromJson(json);

  factory CollectionCoinModel.fromEntity(CollectionCoin coin) => CollectionCoinModel(
        photos: coin.photos,
        coinId: coin.coinId,
      );

  Map<String, dynamic> toJson() => _$CollectionCoinModelToJson(this);

  CollectionCoin toEntity() => CollectionCoin(
        photos: photos,
        coinId: coinId,
      );
}

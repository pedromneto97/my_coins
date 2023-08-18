import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/domain.dart';

part 'collection_coin_model.g.dart';

@JsonSerializable()
class CollectionCoinModel {
  final List<String> photos;
  final String coinId;
  final Preservation preservation;

  const CollectionCoinModel({
    required this.photos,
    required this.coinId,
    this.preservation = Preservation.unknown,
  });

  factory CollectionCoinModel.fromJson(Map<String, dynamic> json) => _$CollectionCoinModelFromJson(json);

  factory CollectionCoinModel.fromEntity(CollectionCoin coin) => CollectionCoinModel(
        photos: coin.photos,
        coinId: coin.coinId,
        preservation: coin.preservation,
      );

  Map<String, dynamic> toJson() => _$CollectionCoinModelToJson(this);

  CollectionCoin toEntity() => CollectionCoin(
        photos: photos,
        coinId: coinId,
        preservation: preservation,
      );
}

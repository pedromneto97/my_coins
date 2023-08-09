// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCoinModel _$CollectionCoinModelFromJson(Map<String, dynamic> json) => CollectionCoinModel(
      photos: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      coinId: json['coinId'] as String,
      preservation: $enumDecodeNullable(_$PreservationEnumMap, json['preservation']) ?? Preservation.unknown,
    );

Map<String, dynamic> _$CollectionCoinModelToJson(CollectionCoinModel instance) => <String, dynamic>{
      'photos': instance.photos,
      'coinId': instance.coinId,
      'preservation': _$PreservationEnumMap[instance.preservation]!,
    };

const _$PreservationEnumMap = {
  Preservation.uncirculated: 'uncirculated',
  Preservation.extremelyFine: 'extremelyFine',
  Preservation.veryFine: 'veryFine',
  Preservation.fine: 'fine',
  Preservation.good: 'good',
  Preservation.poor: 'poor',
  Preservation.unknown: 'unknown',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCoinModel _$CollectionCoinModelFromJson(Map<String, dynamic> json) => CollectionCoinModel(
      photos: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      coinId: json['coinId'] as String,
    );

Map<String, dynamic> _$CollectionCoinModelToJson(CollectionCoinModel instance) => <String, dynamic>{
      'photos': instance.photos,
      'coinId': instance.coinId,
    };

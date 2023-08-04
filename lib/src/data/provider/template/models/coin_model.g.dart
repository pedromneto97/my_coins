// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isRare: json['isRare'] as bool,
    );

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isRare': instance.isRare,
    };

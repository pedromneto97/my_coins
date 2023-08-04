// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinGroupModel _$CoinGroupModelFromJson(Map<String, dynamic> json) => CoinGroupModel(
      name: json['name'] as String,
      isSpecial: json['isSpecial'] as bool,
      coins: (json['coins'] as List<dynamic>).map((e) => CoinModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$CoinGroupModelToJson(CoinGroupModel instance) => <String, dynamic>{
      'name': instance.name,
      'isSpecial': instance.isSpecial,
      'coins': instance.coins.map((e) => e.toJson()).toList(),
    };

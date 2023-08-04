// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinFamilyModel _$CoinFamilyModelFromJson(Map<String, dynamic> json) => CoinFamilyModel(
      name: json['name'] as String,
      coinGroup:
          (json['coinGroup'] as List<dynamic>).map((e) => CoinGroupModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$CoinFamilyModelToJson(CoinFamilyModel instance) => <String, dynamic>{
      'name': instance.name,
      'coinGroup': instance.coinGroup.map((e) => e.toJson()).toList(),
    };

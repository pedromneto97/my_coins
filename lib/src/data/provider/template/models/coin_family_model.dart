import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/domain.dart';
import 'coin_group_model.dart';

part 'coin_family_model.g.dart';

@JsonSerializable()
class CoinFamilyModel {
  final String name;
  final List<CoinGroupModel> coinGroup;

  const CoinFamilyModel({
    required this.name,
    required this.coinGroup,
  });

  factory CoinFamilyModel.fromJson(Map<String, dynamic> json) => _$CoinFamilyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinFamilyModelToJson(this);

  CoinFamily toEntity() {
    final coinGroupList = <CoinGroup>[];
    for (final group in coinGroup) {
      coinGroupList.add(group.toEntity());
    }

    return CoinFamily(
      name: name,
      coinGroup: coinGroupList,
    );
  }
}

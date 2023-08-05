import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/domain.dart';
import '../../template/models/coin_family_model.dart';

class CollectionTemplateModel {
  final String id;
  final String defaultName;
  final List<CoinFamilyModel> coinFamily;

  const CollectionTemplateModel({
    required this.id,
    required this.defaultName,
    required this.coinFamily,
  });

  factory CollectionTemplateModel.fromEntity(CollectionTemplate template) {
    final coinFamilyModelList = <CoinFamilyModel>[];
    for (final family in template.coinFamily) {
      coinFamilyModelList.add(CoinFamilyModel.fromEntity(family));
    }

    return CollectionTemplateModel(
      id: template.id,
      defaultName: template.defaultName,
      coinFamily: coinFamilyModelList,
    );
  }

  factory CollectionTemplateModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    final coinFamilyModelList = <CoinFamilyModel>[];
    for (final family in data['coinFamily'] as List<dynamic>) {
      coinFamilyModelList.add(
        CoinFamilyModel.fromJson(family as Map<String, dynamic>),
      );
    }

    return CollectionTemplateModel(
      id: snapshot.id,
      defaultName: data['defaultName'],
      coinFamily: coinFamilyModelList,
    );
  }

  Map<String, dynamic> toJson() {
    final coinFamily = <Map<String, dynamic>>[];
    for (final family in this.coinFamily) {
      coinFamily.add(family.toJson());
    }

    return {
      'defaultName': defaultName,
      'coinFamily': coinFamily,
    };
  }

  CollectionTemplate toEntity() {
    final coinFamilyList = <CoinFamily>[];
    for (final family in coinFamily) {
      coinFamilyList.add(family.toEntity());
    }

    return CollectionTemplate(
      id: id,
      defaultName: defaultName,
      coinFamily: coinFamilyList,
    );
  }
}

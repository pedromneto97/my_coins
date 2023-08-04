import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/domain.dart';
import 'collection_coin_model.dart';

class CollectionModel {
  final String id;
  final String name;
  final String templateId;
  final List<CollectionCoinModel> coins;
  final bool isPublic;
  final String userId;

  const CollectionModel({
    required this.id,
    required this.name,
    required this.templateId,
    required this.coins,
    required this.isPublic,
    required this.userId,
  });

  factory CollectionModel.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    final coinList = <CollectionCoinModel>[];
    for (final coin in data['coins'] as List<dynamic>) {
      coinList.add(
        CollectionCoinModel.fromJson(coin as Map<String, dynamic>),
      );
    }

    return CollectionModel(
      id: snapshot.id,
      name: data['name'],
      templateId: data['templateId'],
      isPublic: data['isPublic'],
      userId: data['userId'],
      coins: coinList,
    );
  }

  factory CollectionModel.fromEntity(Collection collection, String userId) {
    final coins = <CollectionCoinModel>[];
    for (final coin in collection.coins) {
      coins.add(
        CollectionCoinModel.fromEntity(coin),
      );
    }

    return CollectionModel(
      id: collection.id,
      name: collection.name,
      templateId: collection.templateId,
      coins: coins,
      isPublic: collection.isPublic,
      userId: userId,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'templateId': templateId,
        'isPublic': isPublic,
        'userId': userId,
      };

  Collection toEntity(String currentUserId) {
    final coins = <CollectionCoin>[];
    for (final coin in this.coins) {
      coins.add(
        coin.toEntity(),
      );
    }

    return Collection(
      id: id,
      name: name,
      templateId: templateId,
      canEdit: userId == currentUserId,
      coins: coins,
      isPublic: isPublic,
    );
  }
}

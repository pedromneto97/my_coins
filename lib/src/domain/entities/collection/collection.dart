import 'package:equatable/equatable.dart';

import '../collection_with_template/collection_with_template.dart';
import 'collection_coin.dart';

class Collection extends Equatable {
  final String id;
  final String name;
  final String templateId;
  final bool canEdit;
  final List<CollectionCoin> coins;
  final bool isPublic;

  const Collection({
    required this.id,
    required this.name,
    required this.templateId,
    required this.canEdit,
    required this.coins,
    required this.isPublic,
  });

  factory Collection.fromCollectionWithTemplate(CollectionWithTemplate collectionWithTemplate) => Collection(
        id: collectionWithTemplate.id,
        name: collectionWithTemplate.name,
        templateId: collectionWithTemplate.templateId,
        canEdit: collectionWithTemplate.canEdit,
        coins: const [],
        isPublic: collectionWithTemplate.isPublic,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        templateId,
        canEdit,
        coins,
        isPublic,
      ];

  Collection copyWith({
    String? id,
    String? name,
    String? templateId,
    bool? canEdit,
    List<CollectionCoin>? coins,
    bool? isPublic,
  }) =>
      Collection(
        id: id ?? this.id,
        name: name ?? this.name,
        templateId: templateId ?? this.templateId,
        canEdit: canEdit ?? this.canEdit,
        coins: coins ?? this.coins,
        isPublic: isPublic ?? this.isPublic,
      );
}

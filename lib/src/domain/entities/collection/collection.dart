import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
        id,
        name,
        templateId,
        canEdit,
        coins,
        isPublic,
      ];
}

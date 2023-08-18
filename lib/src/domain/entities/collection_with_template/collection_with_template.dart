import 'package:equatable/equatable.dart';

import 'collection_coin_family.dart';

class CollectionWithTemplate extends Equatable {
  final String id;
  final String name;
  final List<CollectionCoinFamily> coinFamily;
  final bool isPublic;
  final bool canEdit;
  final String templateId;

  const CollectionWithTemplate({
    required this.id,
    required this.name,
    required this.coinFamily,
    required this.isPublic,
    required this.canEdit,
    required this.templateId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        coinFamily,
        isPublic,
        canEdit,
        templateId,
      ];

  CollectionWithTemplate copyWith({
    String? id,
    String? name,
    List<CollectionCoinFamily>? coinFamily,
    bool? isPublic,
    bool? canEdit,
    String? templateId,
  }) =>
      CollectionWithTemplate(
        id: id ?? this.id,
        name: name ?? this.name,
        coinFamily: coinFamily ?? this.coinFamily,
        isPublic: isPublic ?? this.isPublic,
        canEdit: canEdit ?? this.canEdit,
        templateId: templateId ?? this.templateId,
      );
}

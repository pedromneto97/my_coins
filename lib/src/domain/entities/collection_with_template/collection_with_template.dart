import 'package:equatable/equatable.dart';

import 'collection_coin_family.dart';

class CollectionWithTemplate extends Equatable {
  final String id;
  final String name;
  final List<CollectionCoinFamily> coinFamily;
  final bool isPublic;
  final bool canEdit;

  const CollectionWithTemplate({
    required this.id,
    required this.name,
    required this.coinFamily,
    required this.isPublic,
    required this.canEdit,
  });

  @override
  List<Object?> get props => [id, name, coinFamily, isPublic, canEdit];
}

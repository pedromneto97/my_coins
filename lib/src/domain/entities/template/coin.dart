import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String id;
  final String name;
  final bool isRare;

  const Coin({
    required this.id,
    required this.name,
    required this.isRare,
  });

  @override
  List<Object?> get props => [id, name, isRare];
}

import '../../../domain/domain.dart';
import 'base_event.dart';

class CoinAddedEvent extends BaseEvent {
  final CollectionCoin coin;

  const CoinAddedEvent(this.coin);

  @override
  List<Object?> get props => [coin];
}

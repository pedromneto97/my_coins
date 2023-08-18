import '../../../domain/domain.dart';
import 'base_event.dart';

class CollectionUpdatedEvent extends BaseEvent {
  final Collection collection;

  const CollectionUpdatedEvent(this.collection);

  @override
  List<Object?> get props => [collection];
}

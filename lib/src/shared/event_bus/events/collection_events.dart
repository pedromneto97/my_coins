import '../../../domain/domain.dart';
import 'base_event.dart';

abstract class CollectionEvents extends BaseEvent {
  final Collection collection;

  const CollectionEvents(this.collection);

  @override
  List<Object?> get props => [collection];
}

class CollectionUpdatedEvent extends CollectionEvents {
  const CollectionUpdatedEvent(super.collection);
}

class CollectionDeletedEvent extends CollectionEvents {
  const CollectionDeletedEvent(super.collection);
}

class CollectionCreatedEvent extends CollectionEvents {
  const CollectionCreatedEvent(super.collection);
}

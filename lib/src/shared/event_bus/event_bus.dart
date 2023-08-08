import 'dart:async';

import 'events/base_event.dart';

typedef EventCallback<T extends BaseEvent> = void Function(T event);

class EventBus {
  static final I = EventBus._();

  final _stream = StreamController<BaseEvent>.broadcast();

  EventBus._();

  Stream<BaseEvent> get stream => _stream.stream;

  void fire(BaseEvent event) => _stream.add(event);

  StreamSubscription<BaseEvent> listen<T extends BaseEvent>(EventCallback<T> listener) {
    if (T is BaseEvent) {
      return stream.cast<T>().listen(listener);
    }

    return stream.where((event) => event is T).cast<T>().listen(listener);
  }
}

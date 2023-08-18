import '../../../domain/domain.dart';
import '../../../shared/event_bus/event_bus.dart';
import '../../../shared/event_bus/events/collection_updated_event.dart';
import '../../../shared/widgets/collection_form/cubit/upsert_collection/upsert_collection_cubit.dart';

class UpdateCollectionCubit extends UpsertCollectionCubit {
  final UpdateCollectionUseCase _useCase;
  final Collection _collection;

  UpdateCollectionCubit({
    required UpdateCollectionUseCase useCase,
    required Collection collection,
  })  : _collection = collection,
        _useCase = useCase;

  @override
  Future<void> callUseCase({required String templateId, required String name, required bool isPublic}) async {
    final newCollection = _collection.copyWith(
      templateId: templateId,
      name: name,
      isPublic: isPublic,
    );

    await _useCase.call(newCollection);

    EventBus.I.fire(CollectionUpdatedEvent(newCollection));
  }
}

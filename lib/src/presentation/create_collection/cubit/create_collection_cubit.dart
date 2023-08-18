import '../../../domain/domain.dart';
import '../../../shared/event_bus/event_bus.dart';
import '../../../shared/event_bus/events/collection_events.dart';
import '../../../shared/widgets/collection_form/cubit/upsert_collection/upsert_collection_cubit.dart';

class CreateCollectionCubit extends UpsertCollectionCubit {
  final CreateCollectionUseCase _useCase;

  CreateCollectionCubit({
    required CreateCollectionUseCase useCase,
  }) : _useCase = useCase;

  @override
  Future<void> callUseCase({
    required String templateId,
    required String name,
    required bool isPublic,
  }) async {
    final collection = await _useCase.call(name: name, templateId: templateId, isPublic: isPublic);

    EventBus.I.fire(CollectionCreatedEvent(collection));
  }
}

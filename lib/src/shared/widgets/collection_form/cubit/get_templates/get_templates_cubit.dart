import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/domain.dart';

part 'get_templates_state.dart';

class GetTemplatesCubit extends Cubit<GetTemplatesState> {
  final GetTemplatesUseCase _useCase;

  GetTemplatesCubit(
    this._useCase,
  ) : super(const GetTemplatesInitial());

  Future<void> getTemplates() async {
    emit(const GetTemplatesLoading());
    try {
      final templates = await _useCase.call();

      emit(GetTemplatesLoaded(templates: templates));
    } catch (e) {
      emit(const GetTemplatesError());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/domain.dart';

class SelectedTemplateCubit extends Cubit<CollectionTemplate?> {
  SelectedTemplateCubit({required CollectionTemplate? template}) : super(template);

  void changeTemplate(CollectionTemplate? template) => emit(template);
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/domain.dart';

class SelectedPreservationCubit extends Cubit<Preservation> {
  SelectedPreservationCubit() : super(Preservation.unknown);

  void onChangePreservation(Preservation preservation) => emit(preservation);
}

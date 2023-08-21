import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/filter.dart';

class FilterCubit extends Cubit<Filter> {
  FilterCubit(super.filter);

  void changeFilter(Filter filter) => emit(filter);
}

import 'package:flutter_bloc/flutter_bloc.dart';

class PublicCollectionCubit extends Cubit<bool> {
  PublicCollectionCubit({required bool isPublic}) : super(isPublic);

  void changePublic(bool isPublic) => emit(isPublic);
}

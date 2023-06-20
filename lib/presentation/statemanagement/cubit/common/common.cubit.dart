import 'package:flutter_bloc/flutter_bloc.dart';

class BnBCubit extends Cubit<int> {
  BnBCubit() : super(0);

  void onNavigate(int index) => emit(index);
}

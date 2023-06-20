import 'package:blog/domain/usecases/crud/read/stream.cuisines.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cuisine.entity.dart';

part 'cuisine_state.dart';

class CuisineCubit extends Cubit<CuisineState> {
  final StreamCuisines _streamCuisines;
  CuisineCubit(this._streamCuisines) : super(CuisineInitial());

  Future<void> streamCuisines() async {
    emit(CuisineLoading());
    final state = _streamCuisines();
    state.listen((event) {
      if (event.isEmpty) {
        emit(CuisineEmpty());
      } else {
        emit(CuisineLoading());
        emit(CuisineLoaded(cuisines: event));
      }
    });
  }
}

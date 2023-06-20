import 'package:blog/domain/usecases/crud/read/get.user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user.entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser _getUser;
  UserCubit(this._getUser) : super(UserInitial());

  Future<void> getUser(String uid) async {
    emit(CurrentUserLoading());
    final user = await _getUser(uid);
    emit(CurrentUserLoaded(user: user));
  }
}

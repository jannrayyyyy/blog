import 'package:blog/domain/usecases/auth/streamuser.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state_state.dart';

class UserStateCubit extends Cubit<UserStateState> {
  final StreamUser _streamUser;
  UserStateCubit(this._streamUser) : super(UserStateInitial());

  void streamUser() async {
    emit(Authenticating());
    final state = _streamUser();
    state.listen((user) {
      user != null ? emit(Authenticated(user: user)) : emit(UnAuthenticated());
    });
  }
}

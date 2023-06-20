import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/domain/usecases/auth/signin.dart';
import 'package:blog/domain/usecases/auth/signup.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/auth/reload.dart';
import '../../../../../domain/usecases/auth/signout.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final Signin _signin;
  final Signup _signup;
  final Signout _signout;
  final ReloadUser _reloadUser;

  UserAuthCubit(
    this._signin,
    this._signup,
    this._signout,
    this._reloadUser,
  ) : super(UserAuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(SigninLoading());
    final state = await _signin(email, password);
    state.fold(
      (l) => emit(SigninError(message: l.message)),
      (r) => emit(SigninLoaded()),
    );
  }

  Future<void> signUp(UserEntity user) async {
    emit(SignUpLoading());
    final state = await _signup(user);
    state.fold(
      (l) => emit(SignupError(message: l.message)),
      (r) => emit(SignupLoaded()),
    );
  }

  Future<void> signout() async {
    emit(SignOutLoading());
    final state = await _signout();
    state.fold(
      (l) => emit(SignOutError(message: l.message)),
      (r) => emit(SignOutLoaded()),
    );
  }

  Future<void> reloadUser() async {
    emit(UserLoading());
    final state = await _reloadUser();
    state.fold(
      (l) => emit(UserError(message: l.message)),
      (r) => emit(UserLoaded()),
    );
  }
}

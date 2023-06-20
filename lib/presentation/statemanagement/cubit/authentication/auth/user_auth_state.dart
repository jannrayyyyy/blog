// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_auth_cubit.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

class UserAuthInitial extends UserAuthState {}

class SigninLoading extends UserAuthState {}

class SignUpLoading extends UserAuthState {}

class SignOutLoading extends UserAuthState {}

class SigninLoaded extends UserAuthState {}

class SignupLoaded extends UserAuthState {}

class SignOutLoaded extends UserAuthState {}

class SigninError extends UserAuthState {
  final String message;
  const SigninError({required this.message});
}

class SignupError extends UserAuthState {
  final String message;
  const SignupError({required this.message});
}

class SignOutError extends UserAuthState {
  final String message;
  const SignOutError({required this.message});
}

class UserLoading extends UserAuthState {}

class UserLoaded extends UserAuthState {}

class UserError extends UserAuthState {
  final String message;
  const UserError({required this.message});
}

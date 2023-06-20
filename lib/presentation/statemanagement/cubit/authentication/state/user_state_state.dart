// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_state_cubit.dart';

abstract class UserStateState extends Equatable {
  const UserStateState();

  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserStateState {}

class Authenticating extends UserStateState {}

class Authenticated extends UserStateState {
  final User user;
  const Authenticated({required this.user});
}

class UnAuthenticated extends UserStateState {}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class CurrentUserLoading extends UserState {}

class CurrentUserLoaded extends UserState {
  final UserEntity user;
  const CurrentUserLoaded({required this.user});
}

class CurrentUserEmpty extends UserState {}

class CurrentUserUpdating extends UserState {}

class CurrentUserUpdatingSuccessful extends UserState {}

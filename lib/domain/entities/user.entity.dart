// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  String? id;
  String createdAt;
  String? imageUrl;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userAddress;
  final String email;
  final String userPassword;

  UserEntity({
    this.id,
    required this.createdAt,
    this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userAddress,
    required this.email,
    required this.userPassword,
  });

  @override
  List<Object?> get props => [email];
}

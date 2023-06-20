import 'package:blog/domain/entities/user.entity.dart';

// ignore: must_be_immutable
class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.createdAt,
    super.imageUrl,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.userAddress,
    required super.email,
    required super.userPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      createdAt: json['createdAt'],
      imageUrl: json['imageUrl'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      userAddress: json['userAddress'],
      email: json['email'],
      userPassword: json['userPassword'],
    );
  }

  factory UserModel.toEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      createdAt: user.createdAt,
      imageUrl: user.imageUrl,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      userAddress: user.userAddress,
      email: user.email,
      userPassword: user.userPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'imageUrl': imageUrl,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'userAddress': userAddress,
      'email': email,
      'userPassword': userPassword,
    };
  }
}

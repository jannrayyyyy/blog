import 'dart:io';

import 'package:blog/core/utils/error/failure.dart';
import 'package:blog/data/models/user.model.dart';
import 'package:blog/domain/entities/cuisine.entity.dart';
import 'package:blog/domain/entities/user.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Repository {
  Future<Either<Failure, void>> signIn(String email, String password);
  Future<Either<Failure, void>> signUp(UserEntity user);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> reloadUser();
  Stream<User?> streamUser();
  Future<UserModel> getUser(String uid);
  Future<Either<Failure, void>> uploadImageToStorage({
    required String label,
    required File? file,
  });
  Future<String> getDownloadUrl({
    required String label,
    required String path,
  });
  Stream<List<CuisineEntity>> streamCuisines();
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:blog/core/utils/constant/error_code.dart';
import 'package:blog/core/utils/error/failure.dart';
import 'package:blog/data/models/food.model.dart';
import 'package:blog/data/models/user.model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:blog/data/datasource/remote/abstract.dart';
import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/domain/repository/abstract.dart';

import '../../core/utils/error/exception.dart';

class RepositoryImpl implements Repository {
  final RemoteDatasource remote;
  RepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, void>> reloadUser() async {
    try {
      await remote.reloadUser();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, void>> signIn(String email, String password) async {
    try {
      await remote.signIn(email, password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(errorCode(e.code)));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remote.signOut();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(UserEntity user) async {
    try {
      await remote.signUp(UserModel.toEntity(user));
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(e.code));
    }
  }

  @override
  Stream<User?> streamUser() => remote.streamUser();

  @override
  Future<String> getDownloadUrl({
    required String label,
    required String path,
  }) async {
    try {
      return await remote.getDownloadUrl(label: label, path: path);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser(String uid) async {
    return await remote.getUser(uid);
  }

  @override
  Stream<List<CuisineModel>> streamCuisines() {
    return remote.streamCuisines();
  }

  @override
  Future<Either<Failure, void>> uploadImageToStorage({
    required String label,
    required File? file,
  }) async {
    try {
      await remote.uploadImageToStorage(label: label, file: file);
      return const Right(null);
    } on InternetException catch (e) {
      return Left(InternetFailure(errorCode(e.message)));
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
  }

  @override
  Future<void> updateUser(String uid, UserEntity user, String image) async {
    await remote.updateUser(uid, UserModel.toEntity(user), image);
  }
}

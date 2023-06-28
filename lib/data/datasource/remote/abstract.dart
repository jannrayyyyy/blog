import 'dart:io';

import 'package:blog/data/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/food.model.dart';

abstract class RemoteDatasource {
  Future<void> signIn(String email, String password);
  Future<void> signUp(UserModel user);
  Future<void> signOut();
  Future<void> reloadUser();
  Stream<User?> streamUser();
  Future<UserModel> getUser(String uid);
  Future<void> uploadImageToStorage({
    required String label,
    required File? file,
  });
  Future<String> getDownloadUrl({
    required String label,
    required String path,
  });
  Stream<List<CuisineModel>> streamCuisines();
  Future<void> updateUser(String uid, UserModel user, String image);
}

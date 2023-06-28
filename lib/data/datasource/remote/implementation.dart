import 'dart:io';

import 'package:blog/data/datasource/remote/abstract.dart';
import 'package:blog/data/models/food.model.dart';
import 'package:blog/data/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/constant/string.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  @override
  Future<void> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signUp(UserModel user) async {
    final docUser = await auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.userPassword,
    );
    user.id = docUser.user!.uid;
    user.imageUrl = 'https://graph.facebook.com/1271871656883523/picture';
    await db
        .collection('users')
        .doc(user.id)
        .set(user.toMap())
        .then((value) async => await http.post(
              Uri.parse('http://$ip/blog/register.php'),
              body: user.toMap(),
            ));
  }

  @override
  Future<void> reloadUser() async {
    await auth.currentUser!.reload();
  }

  @override
  Stream<User?> streamUser() => auth.authStateChanges();

  @override
  Future<String> getDownloadUrl({
    required String label,
    required String path,
  }) async {
    String downloadUrl =
        await storage.ref().child('$label/$path').getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final customer = await db.collection('users').doc(uid).get();
    return UserModel.fromJson(customer.data() ?? {});
  }

  @override
  Stream<List<CuisineModel>> streamCuisines() {
    return db.collection('cuisines').snapshots().map((event) =>
        event.docs.map((e) => CuisineModel.fromJson(e.data())).toList());
  }

  @override
  Future<void> uploadImageToStorage({
    required String label,
    required File? file,
  }) async {
    await storage
        .ref()
        .child('$label/${file?.path}')
        .putFile(File(file?.path ?? ""));
  }

  @override
  Future<void> updateUser(String uid, UserModel user, String image) async {
    final docRef = db.collection('users').doc(uid);
    user.imageUrl = image;
    await docRef.update(user.toMap()).then(
          (value) async => await http.post(
            Uri.parse('http://$ip/blog/update.user.php'),
            body: user.toMap(),
          ),
        );
  }
}

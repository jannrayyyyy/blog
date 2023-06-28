// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/domain/repository/abstract.dart';

class UpdateUser {
  final Repository repo;
  UpdateUser({required this.repo});

  Future<void> call(String uid, UserEntity user, String image) async {
    await repo.updateUser(uid, user, image);
  }
}

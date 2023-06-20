// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/domain/repository/abstract.dart';

class GetUser {
  final Repository repo;
  GetUser({required this.repo});

  Future<UserEntity> call(String uid) async {
    return await repo.getUser(uid);
  }
}

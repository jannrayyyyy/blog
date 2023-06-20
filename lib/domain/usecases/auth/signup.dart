// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/core/utils/error/failure.dart';
import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/domain/repository/abstract.dart';
import 'package:dartz/dartz.dart';

class Signup {
  final Repository repo;
  Signup({required this.repo});
  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repo.signUp(user);
  }
}

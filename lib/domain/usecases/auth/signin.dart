// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/core/utils/error/failure.dart';
import 'package:blog/domain/repository/abstract.dart';
import 'package:dartz/dartz.dart';

class Signin {
  final Repository repo;
  Signin({required this.repo});
  Future<Either<Failure, void>> call(String email, String password) async {
    return await repo.signIn(email, password);
  }
}

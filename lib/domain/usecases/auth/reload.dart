// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/core/utils/error/failure.dart';
import 'package:blog/domain/repository/abstract.dart';
import 'package:dartz/dartz.dart';

class ReloadUser {
  final Repository repo;
  ReloadUser({required this.repo});
  Future<Either<Failure, void>> call() async {
    return await repo.reloadUser();
  }
}

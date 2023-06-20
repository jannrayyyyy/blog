// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../repository/abstract.dart';

class GetDownloadURL {
  final Repository repo;
  GetDownloadURL({required this.repo});
  Future<String> call(String label, String path) async {
    return await repo.getDownloadUrl(label: label, path: path);
  }
}

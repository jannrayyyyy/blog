import 'dart:io';

import 'package:blog/domain/usecases/crud/read/get.download.url.dart';
import 'package:blog/domain/usecases/crud/read/get.user.dart';
import 'package:blog/domain/usecases/crud/update/update.user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user.entity.dart';
import '../../../../domain/usecases/crud/create/upload.to.storage.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser _getUser;
  final UpdateUser _updateUser;
  final UploadToStorage _uploadToStorage;
  final GetDownloadURL _getDownloadURL;
  UserCubit(
    this._getUser,
    this._updateUser,
    this._uploadToStorage,
    this._getDownloadURL,
  ) : super(UserInitial());

  Future<void> getUser(String uid) async {
    emit(CurrentUserLoading());
    final user = await _getUser(uid);
    emit(CurrentUserLoaded(user: user));
  }

  Future<void> updateUser(
    String label,
    File file,
    String uid,
    UserEntity user,
    String image,
  ) async {
    await _uploadToStorage(label, file).then(
      (value) async => await _updateUser(
        uid,
        user,
        await _getDownloadURL(label, file.path),
      ),
    );
  }
}

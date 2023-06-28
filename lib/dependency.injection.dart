import 'package:blog/data/datasource/remote/implementation.dart';
import 'package:blog/data/repository/implementation.dart';
import 'package:blog/domain/repository/abstract.dart';

import 'package:blog/domain/usecases/auth/reload.dart';
import 'package:blog/domain/usecases/auth/signin.dart';
import 'package:blog/domain/usecases/auth/signout.dart';
import 'package:blog/domain/usecases/auth/signup.dart';
import 'package:blog/domain/usecases/auth/streamuser.dart';
import 'package:blog/domain/usecases/crud/create/upload.to.storage.dart';
import 'package:blog/domain/usecases/crud/read/get.download.url.dart';
import 'package:blog/domain/usecases/crud/read/get.user.dart';
import 'package:blog/domain/usecases/crud/read/stream.cuisines.dart';
import 'package:blog/domain/usecases/crud/update/update.user.dart';

import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/state/user_state_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/cuisine/cuisine_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/remote/abstract.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => UserAuthCubit(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => UserStateCubit(sl()));
  sl.registerFactory(() => CuisineCubit(sl()));
  sl.registerFactory(() => UserCubit(sl(), sl(), sl(), sl()));

  sl.registerLazySingleton(() => Signin(repo: sl()));
  sl.registerLazySingleton(() => Signup(repo: sl()));
  sl.registerLazySingleton(() => Signout(repo: sl()));
  sl.registerLazySingleton(() => ReloadUser(repo: sl()));
  sl.registerLazySingleton(() => StreamUser(repo: sl()));
  sl.registerLazySingleton(() => StreamCuisines(repo: sl()));
  sl.registerLazySingleton(() => GetUser(repo: sl()));
  sl.registerLazySingleton(() => UploadToStorage(repo: sl()));
  sl.registerLazySingleton(() => GetDownloadURL(repo: sl()));
  sl.registerLazySingleton(() => UpdateUser(repo: sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));

  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl());
}

import 'package:blog/presentation/screens/auth/auth.screen.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/state/user_state_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/common/common.cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/cuisine/cuisine_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/user/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency.injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<UserStateCubit>()..streamUser(),
          ),
          BlocProvider(
            create: (context) => sl<UserAuthCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<CuisineCubit>()..streamCuisines(),
          ),
          BlocProvider(
            create: (context) => sl<UserCubit>()
              ..getUser(FirebaseAuth.instance.currentUser?.uid ?? ''),
          ),
          BlocProvider(
            create: (context) => BnBCubit(),
          ),
        ],
        child: const AuthScreen(),
      ),
    );
  }
}

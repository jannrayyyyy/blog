import 'package:blog/presentation/screens/auth/signin.screen.dart';
import 'package:blog/presentation/screens/main.screen.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/state/user_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStateCubit, UserStateState>(
      builder: (context, state) {
        if (state is Authenticating) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is Authenticated) {
          return const MainScreen();
        } else if (state is UnAuthenticated) {
          return const SignInScreen();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

import 'package:blog/presentation/screens/auth/signup.screen.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/common/common.cubit.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency.injection.dart';
import '../../widgets/customs/new.textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final isObscure = context.select((ObscureCubit bloc) => bloc.state);
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              CustomText(
                'Sign in',
                weight: FontWeight.bold,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
              const CustomText(
                'Filipino Cuisine Blog',
                weight: FontWeight.w500,
              ),
              Image.asset(
                'assets/blog-icon.png',
                height: 200,
              ),
              const SizedBox(height: 24),
              NewTextformfield(
                hint: 'Email',
                controller: email,
                maxLines: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 12),
              NewTextformfield(
                hint: 'Password',
                controller: password,
                color: Colors.black,
                maxLines: 1,
                isObscure: isObscure,
                suffix: IconButton(
                  icon: isObscure
                      ? const Icon(Icons.remove_red_eye_outlined)
                      : const Icon(Icons.remove_red_eye),
                  onPressed: () =>
                      context.read<ObscureCubit>().onChanged(!isObscure),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => context.read<UserAuthCubit>().signIn(
                            email.text,
                            password.text,
                          ),
                      child: const CustomText(
                        'Sign in',
                        weight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText('Don\'t have an account? ', size: 12),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (context) => sl<UserAuthCubit>(),
                                  ),
                                  BlocProvider(
                                    create: (context) => ObscureCubit(),
                                  ),
                                ],
                                child: const SignUpScreen(),
                              ),
                            ),
                          ),
                          child: CustomText(
                            'Register',
                            color: Theme.of(context).primaryColor,
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 42),
              BlocListener<UserAuthCubit, UserAuthState>(
                listener: (context, state) {
                  if (state is SigninLoading) {
                    showDialog(
                      context: context,
                      builder: (ctx) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is SigninError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: CustomText(
                          'Email and Password is incorrect',
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    Navigator.pop(context);
                  } else if (state is SigninLoaded) {
                    Navigator.pop(context);
                  }
                },
                child: Container(),
              )
            ],
          ),
        ),
      );
    });
  }
}

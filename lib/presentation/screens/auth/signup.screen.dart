import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/common/common.cubit.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/customs/new.textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final isObscure = context.select((ObscureCubit bloc) => bloc.state);
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    'Sign up',
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
                    hint: 'First Name',
                    controller: firstName,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 12),
                  NewTextformfield(
                    hint: 'Last Name',
                    controller: lastName,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 12),
                  NewTextformfield(
                    hint: 'Phone Number',
                    controller: phoneNumber,
                    maxLines: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 12),
                  NewTextformfield(
                    hint: 'Address',
                    controller: address,
                    maxLines: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final user = UserEntity(
                        createdAt: DateTime.now().toString(),
                        firstName: firstName.text,
                        lastName: lastName.text,
                        phoneNumber: phoneNumber.text,
                        userAddress: address.text,
                        email: email.text,
                        userPassword: password.text,
                      );
                      if (formKey.currentState!.validate()) {
                        context.read<UserAuthCubit>().signUp(user);
                      }
                    },
                    child: const CustomText(
                      'Sign up',
                      weight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 42),
                  BlocListener<UserAuthCubit, UserAuthState>(
                    listener: (context, state) {
                      if (state is SignUpLoading) {
                        showDialog(
                          context: context,
                          builder: (ctx) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is SignupError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: CustomText(
                              state.message,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        Navigator.popUntil(context, (route) => route.isFirst);
                      } else if (state is SignupLoaded) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

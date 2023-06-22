import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:blog/presentation/widgets/customs/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
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
              const SizedBox(height: 64),
              CustomTextField(
                hint: 'First Name',
                controller: firstName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'First Name Field is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Last Name',
                controller: lastName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Last Name Field is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Phone Number',
                controller: phoneNumber,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone Number Field is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Address',
                controller: address,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Address Field is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Email',
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Field is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Password',
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password Field is required!';
                  }
                  return null;
                },
                suffix: IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {},
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
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
    );
  }
}

import 'dart:io';

import 'package:blog/domain/entities/user.entity.dart';
import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/cubit/image_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/user/user_cubit.dart';
import 'package:blog/presentation/widgets/customs/new.textfield.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final email = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final image = context.select((ImageCubit bloc) => bloc.state.xFile);
      return Container(
        decoration: const BoxDecoration(),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is CurrentUserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CurrentUserLoaded) {
              final user = state.user;
              email.text = user.email;
              address.text = user.userAddress;
              phone.text = user.phoneNumber;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: image == null
                              ? CachedNetworkImage(
                                  imageUrl: user.imageUrl ??
                                      'https://graph.facebook.com/1271871656883523/picture',
                                  fit: BoxFit.cover,
                                  height: 100,
                                )
                              : Image.file(
                                  File(image.path),
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            '${user.firstName} ${user.lastName}',
                            weight: FontWeight.bold,
                          ),
                          CustomText(
                            user.email,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (ctx) => Container(
                                  padding: const EdgeInsets.all(12),
                                  height: 200,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () => context
                                            .read<ImageCubit>()
                                            .onImagePick(ImageSource.camera)
                                            .then(
                                              (value) => Navigator.pop(context),
                                            ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.camera,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            const SizedBox(width: 6),
                                            CustomText(
                                              'Camera',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              weight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () => context
                                            .read<ImageCubit>()
                                            .onImagePick(ImageSource.gallery)
                                            .then(
                                              (value) => Navigator.pop(context),
                                            ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.photo,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            const SizedBox(width: 6),
                                            CustomText(
                                              'Gallery',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              weight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: CustomText(
                              'Change Profile Picture',
                              size: 12,
                              color: Theme.of(context).primaryColor,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 62),
                  NewTextformfield(
                    hint: 'Phone Number',
                    controller: phone,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 12),
                  NewTextformfield(
                    hint: 'Address',
                    controller: address,
                    color: Colors.black,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final newUser = UserEntity(
                            id: user.id,
                            createdAt: user.createdAt,
                            firstName: user.firstName,
                            lastName: user.lastName,
                            phoneNumber: phone.text,
                            userAddress: address.text,
                            email: email.text,
                            userPassword: user.userPassword,
                          );
                          context.read<UserCubit>().updateUser(
                                'user',
                                File(image?.path ?? ''),
                                FirebaseAuth.instance.currentUser?.uid ?? '',
                                newUser,
                                '',
                              );
                        },
                        child: const CustomText('Update Profile',
                            weight: FontWeight.w500),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<UserAuthCubit>().signout(),
                        child: const CustomText('Sign out',
                            weight: FontWeight.w500),
                      ),
                    ],
                  ),
                  BlocListener<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is CurrentUserUpdating) {
                        showDialog(
                          context: context,
                          builder: (ctx) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is CurrentUserUpdatingSuccessful) {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(),
                  ),
                  BlocListener<UserAuthCubit, UserAuthState>(
                    listener: (context, state) {
                      if (state is SignOutLoading) {
                        showDialog(
                          context: context,
                          builder: (ctx) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is SignOutLoaded) {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      );
    });
  }
}

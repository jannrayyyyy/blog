import 'package:blog/presentation/statemanagement/cubit/authentication/auth/user_auth_cubit.dart';
import 'package:blog/presentation/statemanagement/cubit/user/user_cubit.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: CachedNetworkImage(
                        imageUrl: user.imageUrl ??
                            'https://graph.facebook.com/1271871656883523/picture',
                        fit: BoxFit.cover,
                        height: 100,
                        placeholder: (context, url) => Image.asset(
                          'assets/blog-icon.png',
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
                          user.phoneNumber,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 62),
                CustomText(
                  user.email,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 12),
                CustomText(
                  user.userAddress,
                  weight: FontWeight.w500,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => context.read<UserAuthCubit>().signout(),
                  child: const CustomText('Sign out', weight: FontWeight.w500),
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
                    } else if (state is SignOutError) {
                      print(state.message);
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
  }
}

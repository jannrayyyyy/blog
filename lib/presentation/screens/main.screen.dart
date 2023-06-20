// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/presentation/screens/main/home.screen.dart';
import 'package:blog/presentation/screens/main/profile.screen.dart';
import 'package:blog/presentation/statemanagement/cubit/common/common.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final currentIndex = context.select((BnBCubit bloc) => bloc.state);
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: screens[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            context.read<BnBCubit>().onNavigate(value);
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}

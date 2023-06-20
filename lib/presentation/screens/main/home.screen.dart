import 'package:blog/presentation/statemanagement/cubit/cuisine/cuisine_cubit.dart';
import 'package:blog/presentation/widgets/components/home/blog.container.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CustomText(
            'Filipino Popular Cuisines',
            weight: FontWeight.bold,
            size: 18,
          ),
          const SizedBox(height: 12),
          BlocBuilder<CuisineCubit, CuisineState>(
            bloc: context.read<CuisineCubit>()..streamCuisines(),
            builder: (context, state) {
              if (state is CuisineLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CuisineLoaded) {
                return Column(
                  children: state.cuisines
                      .map(
                        (e) => BlogContainer(food: e),
                      )
                      .toList(),
                );
              } else if (state is CuisineEmpty) {
                return Container(
                  padding: const EdgeInsets.all(50),
                  height: 500,
                  child: const Center(
                    child: CustomText(
                      'No avaialble Filipino cuisines at the moment!',
                      align: TextAlign.center,
                      weight: FontWeight.w500,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}

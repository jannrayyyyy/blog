// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/cuisine.entity.dart';

class FoodInfoScreen extends StatelessWidget {
  final CuisineEntity food;
  const FoodInfoScreen({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'Food Information',
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          food.isFavorite
              ? IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                )
              : const SizedBox()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  food.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Divider(),
              CustomText(
                food.title,
                weight: FontWeight.bold,
                size: 18,
              ),
              const SizedBox(height: 4),
              CustomText(
                food.desc,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 12),
              const CustomText(
                'Ingredrients',
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: food.ingredients.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: CustomText(
                      e,
                      weight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              const CustomText(
                'Procedure',
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: food.procedure.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: CustomText(
                      e,
                      weight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              food.notes.isEmpty
                  ? const SizedBox()
                  : const CustomText(
                      'Notes',
                      weight: FontWeight.bold,
                    ),
              food.notes.isEmpty
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: food.notes.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: CustomText(
                            e,
                            weight: FontWeight.w500,
                          ),
                        );
                      }).toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

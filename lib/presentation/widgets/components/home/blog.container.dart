import 'package:blog/domain/entities/cuisine.entity.dart';
import 'package:blog/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';

import '../../../screens/extensions/food.info.screen.dart';

class BlogContainer extends StatelessWidget {
  final CuisineEntity food;
  const BlogContainer({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              food.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                food.title,
                weight: FontWeight.bold,
                size: 13,
              ),
              CustomText(
                food.desc,
                size: 12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => FoodInfoScreen(
                  food: food,
                ),
              ),
            ),
            child: const CustomText(
              'View More',
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

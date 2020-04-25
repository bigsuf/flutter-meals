import 'package:flutter/material.dart';
import 'package:meals/data/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  static const String routerName = '/meals-list';
  // final String id;
  // final String title;

  // MealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    final categoryTitle = args['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var mealItemData = categoryMeals[index];
          return MealItem(
            id: mealItemData.id,
            title: mealItemData.title,
            imageUrl: mealItemData.imageUrl,
            affordability: mealItemData.affordability,
            complexity: mealItemData.complexity,
            duration: mealItemData.duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/data/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  static const String routerName = '/meals-list';
  final List<Meal> availableMeals;

  MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var mealItemData = displayedMeals[index];
          return MealItem(
            id: mealItemData.id,
            title: mealItemData.title,
            imageUrl: mealItemData.imageUrl,
            affordability: mealItemData.affordability,
            complexity: mealItemData.complexity,
            duration: mealItemData.duration,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

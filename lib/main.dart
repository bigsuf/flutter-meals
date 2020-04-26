import 'package:flutter/material.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_detail.dart';

import 'package:meals/screens/meals.dart';
import 'package:meals/screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontFamily: 'Roboto Condensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: MainTabBar.routerName,
      routes: {
        MainTabBar.routerName: (ctx) => MainTabBar(),
        MealsScreen.routerName: (ctx) => MealsScreen(),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(),
        FiltersScreen.routerName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (context) {
        return MaterialPageRoute(
          builder: (ctx) => MainTabBar(),
        );
      },
    );
  }
}

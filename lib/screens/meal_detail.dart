import 'package:flutter/material.dart';
import 'package:meals/data/meals.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static String routName = '/meal-details';

  Widget buildTitle(context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      width: double.infinity,
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildListContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String passedID = ModalRoute.of(context).settings.arguments;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == passedID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildListContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps to Make it'),
            buildListContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            FlatButton.icon(
              textColor: Colors.red,
              icon: Icon(Icons.delete),
              label: Text('Remove'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

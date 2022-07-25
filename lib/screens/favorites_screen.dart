import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeal.length,
          itemBuilder: ((context, index) {
            return MealItem(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageUrl: favoriteMeal[index].imageUrl,
              duration: favoriteMeal[index].duration,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability,
            );
          }));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/components/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    return favorites.length == 0
        ? Center(
            child: Text('You have no favorites yet'),
          )
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              final selected = favorites[idx];

              return MealItem(
                  id: selected.id,
                  title: selected.title,
                  imageUrl: selected.imageUrl,
                  duration: selected.duration,
                  complexity: selected.complexityText,
                  affordability: selected.affordabilityText);
            },
            itemCount: favorites.length,
          );
  }
}

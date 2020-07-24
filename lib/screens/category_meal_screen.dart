import 'package:flutter/material.dart';
import 'package:flutter_meals/components/meal_item.dart';
import 'package:flutter_meals/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routeName = '/category-meals';
  final List<Meal> _availableMeals;

  const CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool _loadInitData = false;
  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String categoryID = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = widget._availableMeals
          .where((meal) => meal.categories.contains(categoryID))
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryID = routeArgs['id'];

    final filteredCategories = widget._availableMeals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          final selected = filteredCategories[idx];

          return MealItem(
              id: selected.id,
              title: selected.title,
              imageUrl: selected.imageUrl,
              duration: selected.duration,
              complexity: selected.complexityText,
              affordability: selected.affordabilityText);
        },
        itemCount: filteredCategories.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_meals/components/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static final routeName = '/category-main';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(5),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.id, catData.title, catData.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}

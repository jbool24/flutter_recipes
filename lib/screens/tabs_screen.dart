import 'package:flutter/material.dart';
import 'package:flutter_meals/components/main_drawer.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/screens/categories_screen.dart';
import 'package:flutter_meals/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _screens;

  int _selectedPageIdx = 0;

  void _selectedPage(int idx) {
    setState(() {
      _selectedPageIdx = idx;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categories', 'widget': CategoriesScreen()},
      {'title': 'Favorites', 'widget': FavoritesScreen(widget.favoriteMeals)}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dinner Dash - ${_screens[_selectedPageIdx]['title']}'),
          ),
          drawer: MainDrawer(),
          body: _screens[_selectedPageIdx]['widget'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectedPage,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
            currentIndex: _selectedPageIdx,
            backgroundColor: Theme.of(context).primaryColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text('Categories'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stars),
                title: Text('Favorites'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

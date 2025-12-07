import 'package:flutter/material.dart';
import 'package:hip_menu/models/meal.dart';
import 'package:hip_menu/screens/categories_screen.dart';
import 'package:hip_menu/screens/filters_screen.dart';
import 'package:hip_menu/screens/meals_screen.dart';
import 'package:hip_menu/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPage = 0;
  final List<Meal> _favouriteMeals = [];

  void _toggleMealFavourite(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    isExisting
        ? setState(() {
            _favouriteMeals.remove(meal);
          })
        : setState(() {
            _favouriteMeals.add(meal);
          });
  }

  void _selectPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = "Categories";

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavourite,
    );

    if (_currentPage == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavourite,
      );
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hip_menu/screens/categories_screen.dart';
import 'package:hip_menu/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPage = 0;
  var _activePageTitle = "Categories";

  void _selectPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget activePage = const CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    if (_currentPage == 1) {
      activePage = const MealsScreen(meals: []);
      _activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(_activePageTitle)),
      body: activePage,
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

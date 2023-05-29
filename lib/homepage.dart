import 'package:flutter/material.dart' hide NavigationBar;
import 'package:grocery_list_app/navigation/navigation_bar.dart';
import 'package:grocery_list_app/shopping_list/shopping_list.dart';

// Makes sure Body pages are defines for each of the menu item.
const bodyPages = [
  ShoppingList(),
  Scaffold(),
  Scaffold(),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navigationBarIndex = 0;

  void handleNavigationTabChange(index) {
    setState(() {
      navigationBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(navigationBarIndex);
    return Scaffold(
      // @todo : Make the body reactive with the navbar selected option.
      // @todo : Apply a darker style.
      // @todo : Maybe we can have 2 themes one light and dark.
      body: bodyPages[navigationBarIndex],
      bottomNavigationBar: NavigationBar(
        onTabChange: handleNavigationTabChange,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:frontend/Activities/cart_activity.dart';
import 'package:frontend/Activities/menu_activity.dart';
import 'package:frontend/Activities/profile_activity.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MenuActivity(),
    CartActivity(),
    ProfileActivity(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)]),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_food_beverage),
                label: 'МЕНЮ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'КОРЗИНА',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'ПРОФИЛЬ',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }
}

// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:grocery_task/Pages/account_page.dart';
import 'package:grocery_task/Pages/cart_page.dart';
import 'package:grocery_task/Pages/explore_page.dart';
import 'package:grocery_task/Pages/favorites_page.dart';
import 'package:grocery_task/Pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget>pages = [
    ShopPage(),
    ExplorePage(),
    CartPage(),
    FavoritePages(),
    AccountPage(),
  ];
  int _bottomBarSelectedIndex = 0;

  void _setBottomBarSelectedIndex(int index){
    setState(() {
      _bottomBarSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomBarSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomBarSelectedIndex,
        selectedItemColor: Color(0xff53b175),
        selectedIconTheme: IconThemeData(color:Color(0xff53b175)),
        onTap:  _setBottomBarSelectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.manage_search_sharp,), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border,), label: "Favotire"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined,), label: "Account"),
        ],
      ),
    );
  }
}
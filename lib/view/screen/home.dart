import 'package:bwi_shopify/controller/constant.dart';
import 'package:bwi_shopify/view/navigation/order_cart_item.dart';
import 'package:bwi_shopify/view/navigation/my_order_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation/cart_page.dart';
import '../navigation/category_page.dart';
import '../navigation/home_page.dart';
import '../navigation/profile_page.dart';
import '../navigation/search_nav_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _optionWidget = const [
    HomePage(),
    MyOrderHistory(),
    CartPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _optionWidget.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: logoColor,
        selectedLabelStyle: GoogleFonts.roboto(
            fontSize: 12, fontWeight: FontWeight.w400, color: logoColor),
        unselectedLabelStyle:
            GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_swap),
            label: "My Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: "My Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

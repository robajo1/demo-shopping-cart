import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/cartPage.dart';
import 'package:shopping_cart/pages/homePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedindex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  List<Widget> page = [
    const home(),
    const Cartpage(),
    const Center(
      child: Text("About us"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 255, 255, 255),
      body: page[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_rounded), label: "About us"),
        ],
      ),
    );
  }
}

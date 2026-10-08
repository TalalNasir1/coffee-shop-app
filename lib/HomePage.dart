// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'widgets/BoldText.dart';
import 'Tile.dart';
import 'DetailPage.dart';
import 'Tile2.dart';
import 'CartPage.dart';
import 'FavoritesPage.dart'; // Import the Favorites page

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List Names = [
    "Cappuccino",
    "Latte",
    "Espresso",
    "Americano",
    "Mocha",
  ];

  final List Price = [
    "4.20",
    "5.50",
    "3.80",
    "4.00",
    "6.00",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(),
                ),
              );
            }
            if (index == 2) { 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(), 
                ),
              );
            }
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(), 
                ),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.orange),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.orange),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.orange),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.orange),
              label: "Notifications",
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.apps, 
                          size: 30,
                          color: Colors.grey.withValues(alpha: 1.5),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withValues(alpha: 0.3),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/2.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: BoldText(title: "Find The Best\nCoffee For You", size: 35, color: Colors.white),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey.withValues(alpha: 1.5)),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search for coffee...",
                              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 1.5)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 30,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Names.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: BoldText(
                            title: Names[index], 
                            size: 20, 
                            color: index == 0 
                              ? Colors.orange 
                              : Colors.grey.withValues(alpha: 1.5),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailpage(
                          coffeeName: "Cappuccino",
                          subtitle: "With Oat Milk",
                          imagePath: "assets/Coffee1.jpg",
                          defaultPrice: 4.20,
                        ),
                      ),
                    );
                  },
                  child: Tile(), // Your existing tile widget
                ),
                SizedBox(height: 30),
                BoldText(title: "Special For You", size: 30, color: Colors.white),
                SizedBox(height: 20),
                Tile2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: file_names, sized_box_for_whitespace, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'widgets/BoldText.dart';
import 'widgets/LightText.dart';
import 'DetailPage.dart';

class Tile2 extends StatelessWidget {
  Tile2({super.key});

  final List Names = [
    "Cappuccino",
    "Latte",
    "Espresso",
    "Americano",
    "Mocha",
  ];
  
  final List Special = [
    "Cortado",
    "Dalgona Coffee",
    "Irish Coffee",
    "Affogato",
    "Frappuccino",
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
    return Container(
      height: 290,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Names.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailpage(
                    coffeeName: Special[index],
                    subtitle: "Special Edition",
                    imagePath: "assets/Coffee1.jpg",
                    defaultPrice: double.parse(Price[index]),
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(15),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.withValues(alpha: 0.3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coffee Image Container
                  Container(
                    height: 160,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Coffee1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 15),
                  
                  // Expanded Column to prevent overflow on the right side
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldText(
                          title: "5 Coffee Beans You Must Try!", 
                          size: 15, 
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        BoldText(
                          title: Special[index], 
                          size: 18, 
                          color: Colors.white,
                        ),
                        LightText(
                          title: "With Oat Milk", 
                          size: 13, 
                          color: Colors.grey.withValues(alpha: 1.5),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                BoldText(title: "\$", size: 18, color: Colors.orange),
                                SizedBox(width: 4),
                                BoldText(title: Price[index], size: 18, color: Colors.white),
                              ],
                            ),
                            Container(
                              height: 36,
                              width: 36,
                              child: Icon(Icons.add, color: Colors.white),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
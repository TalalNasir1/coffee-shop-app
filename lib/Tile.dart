// ignore_for_file: file_names, sized_box_for_whitespace, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'widgets/BoldText.dart';
import 'widgets/LightText.dart';
import 'DetailPage.dart';

class Tile extends StatelessWidget {
  Tile({super.key});

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
    return Container(
      height: 290,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Names.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailpage(
                    coffeeName: Names[index],
                    subtitle: "With Oat Milk",
                    imagePath: "assets/Coffee1.jpg",
                    defaultPrice: double.parse(Price[index]),
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              height: 290,
              width: 185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.withValues(alpha: 0.3),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22.0, 180.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(title: Names[index], size: 20, color: Colors.white),
                        LightText(title: "With Oat Milk", size: 15, color: Colors.grey.withValues(alpha: 1.5)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            BoldText(title: "\$", size: 20, color: Colors.orange),
                            SizedBox(width: 5),
                            BoldText(title: Price[index], size: 20, color: Colors.white),
                            Container(
                              margin: EdgeInsets.only(left: 50),
                              height: 40,
                              width: 40,
                              child: Icon(Icons.add, color: Colors.white),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                    child: Container(
                      height: 160,
                      width: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Coffee1.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        BoldText(title: "4.5", size: 12, color: Colors.white),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 10, left: 100),
                    height: 20,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.grey.withValues(alpha: 0.4),
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
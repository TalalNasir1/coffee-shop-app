// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'widgets/BoldText.dart';
import 'widgets/LightText.dart';

// Shared manager class to store favorites globally across pages
class FavoriteManager {
  static List<Map<String, dynamic>> favoriteItems = [];
}

class Detailpage extends StatefulWidget {
  final String coffeeName;
  final String subtitle;
  final String imagePath;
  final double defaultPrice;

  const Detailpage({
    super.key,
    required this.coffeeName,
    required this.subtitle,
    required this.imagePath,
    required this.defaultPrice,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int Quantity = 1;
  bool isFavourite = false;
  String selectedML = '250ml'; // Default selection

  @override
  void initState() {
    super.initState();
    // Check if this item is already favorited
    isFavourite = FavoriteManager.favoriteItems.any(
      (item) => item['name'] == widget.coffeeName && item['size'] == selectedML,
    );
  }

  // Function to calculate dynamic price based on size multipliers
  double calculatePrice() {
    double basePrice = widget.defaultPrice; 
    if (selectedML == '500ml') {
      basePrice += 1.00;
    } else if (selectedML == '750ml') {
      basePrice += 2.00;
    }
    return basePrice * Quantity;
  }

  // Helper widget for size selection boxes
  Widget _buildSizeOption(String ml) {
    bool isSelected = selectedML == ml;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedML = ml;
          isFavourite = FavoriteManager.favoriteItems.any(
            (item) => item['name'] == widget.coffeeName && item['size'] == selectedML,
          );
        });
      },
      child: Container(
        height: 40,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent,
          ),
        ),
        child: BoldText(
          title: ml,
          size: 14,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Section: Stack for Image and Overlapping Elements
              Stack(
                children: [
                  // Background Image
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Back Button
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                  // Favorite Button
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withValues(alpha: 0.3),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;

                            final itemData = {
                              "name": widget.coffeeName,
                              "subtitle": widget.subtitle,
                              "image": widget.imagePath,
                              "price": calculatePrice(),
                              "size": selectedML,
                              "quantity": Quantity,
                            };

                            if (isFavourite) {
                              if (!FavoriteManager.favoriteItems.any(
                                (item) => item['name'] == widget.coffeeName && item['size'] == selectedML)) {
                                FavoriteManager.favoriteItems.add(itemData);
                              }
                            } else {
                              FavoriteManager.favoriteItems.removeWhere(
                                (item) => item['name'] == widget.coffeeName && item['size'] == selectedML,
                              );
                            }
                          });
                        },
                        child: Icon(Icons.favorite,
                            color: isFavourite ? Colors.red : Colors.white),
                      ),
                    ),
                  ),

                  // Overlapping Rating Container
                  Positioned(
                    bottom: 0,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withValues(alpha: 0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BoldText(
                                        title: widget.coffeeName,
                                        size: 30,
                                        color: Colors.white),
                                    SizedBox(height: 5),
                                    LightText(
                                        title: widget.subtitle,
                                        size: 15,
                                        color: Colors.grey.withValues(alpha: 1.5)),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.coffee_maker,
                                      color: Colors.white),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            // Rating Row
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 15),
                                SizedBox(width: 5),
                                BoldText(
                                    title: "4.5", size: 15, color: Colors.white),
                                SizedBox(width: 10),
                                BoldText(
                                    title: "(6.986)",
                                    size: 15,
                                    color: Colors.white)
                              ],
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 15.0),
                child: LightText(
                    title:
                        "${widget.coffeeName} is a high-quality coffee-based drink made primarily from rich espresso and fresh milk. Prepared expertly for a smooth taste.",
                    size: 15,
                    color: Colors.white),
              ),

              // ML Size Selection Row
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText(title: "Size", size: 16, color: Colors.white),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSizeOption('250ml'),
                        _buildSizeOption('500ml'),
                        _buildSizeOption('750ml'),
                      ],
                    ),
                  ],
                ),
              ),

              // Quantity Container
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (Quantity > 1) {
                                Quantity--;
                              }
                            });
                          },
                          child: Icon(Icons.remove, color: Colors.white)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                    ),
                    BoldText(
                        title: "$Quantity", size: 20, color: Colors.white),
                    Container(
                      height: 40,
                      width: 40,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Quantity++;
                            });
                          },
                          child: Icon(Icons.add, color: Colors.white)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
              ),

              // Dynamic Price & Add to Cart Button
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 15.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LightText(
                            title: "Price",
                            size: 14,
                            color: Colors.grey),
                        BoldText(
                            title: "\$${calculatePrice().toStringAsFixed(2)}",
                            size: 24,
                            color: Colors.white),
                      ],
                    ),
                    Container(
                      height: 55,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: BoldText(
                            title: "Add to Cart",
                            size: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
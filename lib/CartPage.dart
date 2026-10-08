// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'widgets/BoldText.dart';
import 'widgets/LightText.dart';
import 'PaymentScreen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Structured data to handle both single-size and multi-size items
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Cappuccino",
      "subtitle": "With Steamed Milk",
      "roasted": "Medium Roasted",
      "image": "assets/Coffee1.jpg",
      "sizes": [
        {"size": "S", "price": 4.20, "quantity": 1},
        {"size": "M", "price": 4.20, "quantity": 1},
        {"size": "L", "price": 4.20, "quantity": 1},
      ]
    },
    {
      "name": "Cappuccino",
      "subtitle": "With Steamed Milk",
      "roasted": "",
      "image": "assets/Coffee1.jpg", 
      "sizes": [
        {"size": "M", "price": 6.20, "quantity": 1},
      ]
    },
    {
      "name": "Robusta Beans",
      "subtitle": "From Africa",
      "roasted": "",
      "image": "assets/Bean1.jpg", 
      "sizes": [
        {"size": "250gm", "price": 6.20, "quantity": 1},
      ]
    }
  ];

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      for (var sizeData in item["sizes"]) {
        total += (sizeData["price"] * sizeData["quantity"]);
      }
    }
    return total;
  }

  void incrementQuantity(int itemIndex, int sizeIndex) {
    setState(() {
      cartItems[itemIndex]["sizes"][sizeIndex]["quantity"]++;
    });
  }

  void decrementQuantity(int itemIndex, int sizeIndex) {
    setState(() {
      if (cartItems[itemIndex]["sizes"][sizeIndex]["quantity"] > 1) {
        cartItems[itemIndex]["sizes"][sizeIndex]["quantity"]--;
      } else {
        cartItems[itemIndex]["sizes"].removeAt(sizeIndex);
        if (cartItems[itemIndex]["sizes"].isEmpty) {
          cartItems.removeAt(itemIndex);
        }
      }
    });
  }

  // Reusable widget for Size Label (S, M, L, 250gm)
  Widget _buildSizeBox(String sizeStr, {double width = 70}) {
    return Container(
      width: width,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BoldText(title: sizeStr, size: 14, color: Colors.white),
    );
  }

  // Reusable widget for Price ($ 4.20)
  Widget _buildPrice(double price) {
    return Row(
      children: [
        BoldText(title: "\$ ", size: 16, color: Colors.orange),
        BoldText(title: price.toStringAsFixed(2), size: 16, color: Colors.white),
      ],
    );
  }

  // Reusable widget for [-] [ 1 ] [+]
  Widget _buildQuantityControls(int itemIndex, int sizeIndex, int quantity) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => decrementQuantity(itemIndex, sizeIndex),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.remove, color: Colors.white, size: 20),
          ),
        ),
        Container(
          height: 30,
          width: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange, width: 1),
          ),
          child: BoldText(title: "$quantity", size: 14, color: Colors.white),
        ),
        GestureDetector(
          onTap: () => incrementQuantity(itemIndex, sizeIndex),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0F14), // Dark theme background matching the image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.grid_view_rounded, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BoldText(title: "Cart", size: 20, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey.withValues(alpha: 1.5),
              backgroundImage: AssetImage("assets/2.png"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(
                    child: LightText(
                        title: "Your cart is empty",
                        size: 16,
                        color: Colors.grey),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      bool isMultiSize = item["sizes"].length > 1;

                      if (isMultiSize) {
                        // MULTI-SIZE LAYOUT (First item in screenshot)
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xFF141921),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(item["image"], height: 80, width: 80, fit: BoxFit.cover),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BoldText(title: item["name"], size: 18, color: Colors.white),
                                      SizedBox(height: 5),
                                      LightText(title: item["subtitle"], size: 12, color: Colors.grey),
                                      SizedBox(height: 10),
                                      if (item["roasted"].isNotEmpty)
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: LightText(title: item["roasted"], size: 10, color: Colors.grey),
                                        )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 15),
                              ...List.generate(item["sizes"].length, (sizeIndex) {
                                var sizeData = item["sizes"][sizeIndex];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildSizeBox(sizeData["size"]),
                                      _buildPrice(sizeData["price"]),
                                      _buildQuantityControls(index, sizeIndex, sizeData["quantity"]),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      } else {
                        // SINGLE-SIZE LAYOUT (Second & Third items in screenshot)
                        var sizeData = item["sizes"][0];
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xFF141921),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(item["image"], height: 100, width: 100, fit: BoxFit.cover),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BoldText(title: item["name"], size: 16, color: Colors.white),
                                    SizedBox(height: 5),
                                    LightText(title: item["subtitle"], size: 12, color: Colors.grey),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildSizeBox(sizeData["size"], width: 60),
                                        _buildPrice(sizeData["price"]),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _buildQuantityControls(index, 0, sizeData["quantity"]),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    },
                  ),
          ),

          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LightText(title: "Total Price", size: 14, color: Colors.grey),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        BoldText(title: "\$ ", size: 24, color: Colors.orange),
                        BoldText(title: calculateTotal().toStringAsFixed(2), size: 24, color: Colors.white),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Processing Payment...")),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: BoldText(title: "Pay", size: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ADDED: Bottom Navigation Bar matching your app style
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF0C0F14),
        currentIndex: 2, // Cart is index 2, so it stays highlighted here
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context); // Go back to Home if home icon is tapped
          }
          // You can add navigation logic for other indices here if needed
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
        ],
      ),
    );
  }
}
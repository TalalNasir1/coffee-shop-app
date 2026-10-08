import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'widgets/BoldText.dart';
import 'widgets/LightText.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: BoldText(title: "Favorites", size: 20, color: Colors.white),
        centerTitle: true,
      ),
      body: FavoriteManager.favoriteItems.isEmpty
          ? Center(
              child: LightText(
                title: "No favorites added yet!",
                size: 16,
                color: Colors.grey,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: FavoriteManager.favoriteItems.length,
              itemBuilder: (context, index) {
                final item = FavoriteManager.favoriteItems[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF141921),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item["image"],
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(title: item["name"], size: 16, color: Colors.white),
                            SizedBox(height: 4),
                            LightText(title: "${item["subtitle"]} • Size: ${item["size"]}", size: 12, color: Colors.grey),
                            SizedBox(height: 8),
                            BoldText(
                              title: "\$${item["price"].toStringAsFixed(2)}",
                              size: 16,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            FavoriteManager.favoriteItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
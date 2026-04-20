import 'package:car_marketplace/data/favorite_store.dart';
import 'package:car_marketplace/widgets/circle_icon_button_widget.dart';
import 'package:flutter/material.dart';

class FavoritesCarScreen extends StatefulWidget {
  const FavoritesCarScreen({super.key});

  @override
  State<FavoritesCarScreen> createState() => _FavoritesCarScreenState();
}

class _FavoritesCarScreenState extends State<FavoritesCarScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesStore.favorites;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        title: const Text('Favorites Cars'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleIconButtonWidget(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorite cars yet",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final car = favorites[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade900,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset(car.imagePath, width: 80),

                      const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.brandName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${car.price}",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      CircleIconButtonWidget(
                        icon: Icons.delete,
                        onPressed: () {
                          setState(() {
                            FavoritesStore.favorites.removeAt(index);
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
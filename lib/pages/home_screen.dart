import 'package:avatar_plus/avatar_plus.dart';
import 'package:car_marketplace/data/favorite_store.dart';
import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/pages/cars_screen.dart';
import 'package:car_marketplace/pages/favorites_car_screen.dart';
import 'package:car_marketplace/pages/notifications_screen.dart';
import 'package:car_marketplace/pages/settings_screen.dart';
import 'package:car_marketplace/widgets/brand_badge_widget.dart';
import 'package:car_marketplace/widgets/car_card_widget.dart';
import 'package:car_marketplace/widgets/circle_icon_button_widget.dart';
import 'package:car_marketplace/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CarModel> allCars;
  late List<CarModel> filteredCars;

  @override
  void initState() {
    super.initState();

    allCars = [
      CarModel(
        imagePath: 'assets/cars/nissan.png',
        brandName: 'Nissan Pathfinder',
        year: '2025',
        location: 'Jakarta',
        brandLogo: 'assets/brands-logo/nissan.png',
        price: 45000,
        description: 'Spacious SUV with advanced safety and modern tech.',
        transmission: 'Automatic',
        bodyType: 'SUV',
        highway: '10 km/l',
        engine: '3.5L V6',
        exteriorColor: 'Black',
        fuelType: 'Petrol',
      ),
      CarModel(
        imagePath: 'assets/cars/bmw.png',
        brandName: 'BMW X5',
        year: '2025',
        location: 'US, California',
        brandLogo: 'assets/brands-logo/bmw.png',
        price: 55000,
        description: 'Sporty SUV combining performance and comfort.',
        transmission: 'Automatic',
        bodyType: 'SUV',
        highway: '11 km/l',
        engine: '3.0L Inline-6',
        exteriorColor: 'Blue',
        fuelType: 'Petrol',
      ),
    ];

    filteredCars = List.from(allCars);
  }

  void onFavoritePressed(int index) {
    setState(() {
      final car = filteredCars[index];
      car.isFavorite = !(car.isFavorite ?? false);

      if (car.isFavorite == true) {
        FavoritesStore.favorites.add(car);
      } else {
        FavoritesStore.favorites.remove(car);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 1,
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: ListTile(
          leading: AvatarPlus("John"),
          title: const Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          subtitle: const Text(
            'Eustache Kamala',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 8,
                      right: 5,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleIconButtonWidget(
                      icon: Icons.notifications,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(width: 10),

                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  color: Colors.teal.shade900,
                  onSelected: (value) {
                    switch (value) {
                      case 'favorites':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FavoritesCarScreen(),
                          ),
                        );
                        break;

                      case 'settings':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                        break;
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'favorites',
                      child: Text('Favorites Cars'),
                    ),
                    PopupMenuItem(value: 'settings', child: Text('Settings')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Let's Find Your Favorite Car Here",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              SearchBarWidget(
                allCars: allCars,
                onResults: (filtered) {
                  setState(() {
                    filteredCars = filtered;
                  });
                },
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending Brands",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CarsScreen()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BrandBadgeWidget(
                      imagePath: 'assets/brands-logo/nissan.png',
                      brandName: 'Nissan',
                    ),
                    SizedBox(width: 15),
                    BrandBadgeWidget(
                      imagePath: 'assets/brands-logo/mercedes.png',
                      brandName: 'Mercedes',
                    ),
                    SizedBox(width: 15),
                    BrandBadgeWidget(
                      imagePath: 'assets/brands-logo/bmw.png',
                      brandName: 'BMW',
                    ),
                    SizedBox(width: 15),
                    BrandBadgeWidget(
                      imagePath: 'assets/brands-logo/mazda.png',
                      brandName: 'Mazda',
                    ),
                    SizedBox(width: 15),
                    BrandBadgeWidget(
                      imagePath: 'assets/brands-logo/tesla.png',
                      brandName: 'Tesla',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredCars.length,
                  itemBuilder: (context, index) {
                    return CarCardWidget(
                      carModel: filteredCars[index],
                      onFavoritePressed: () => onFavoritePressed(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

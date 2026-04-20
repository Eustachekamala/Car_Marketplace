import 'package:avatar_plus/avatar_plus.dart';
import 'package:car_marketplace/data/favorite_store.dart';
import 'package:car_marketplace/model/car_model.dart';
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
  late List<CarModel> cars;

  @override
  void initState() {
    super.initState();
    cars = [
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
        imagePath: 'assets/cars/mercedes.png',
        brandName: 'Mercedes-Benz C-Class',
        year: '2024',
        location: 'Bandung',
        brandLogo: 'assets/brands-logo/mercedes.png',
        price: 60000,
        description: 'Luxury sedan with premium interior and smooth ride.',
        transmission: 'Automatic',
        bodyType: 'Sedan',
        highway: '12 km/l',
        engine: '2.0L Turbo',
        exteriorColor: 'White',
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
      CarModel(
        imagePath: 'assets/cars/mazda.png',
        brandName: 'Mazda CX-5',
        year: '2022',
        location: 'China',
        brandLogo: 'assets/brands-logo/mazda.png',
        price: 30000,
        description: 'Reliable compact SUV with great fuel efficiency.',
        transmission: 'Automatic',
        bodyType: 'SUV',
        highway: '14 km/l',
        engine: '2.5L',
        exteriorColor: 'Red',
        fuelType: 'Petrol',
      ),
      CarModel(
        imagePath: 'assets/cars/tesla.png',
        brandName: 'Tesla Model S',
        year: '2026',
        location: 'Singapore',
        brandLogo: 'assets/brands-logo/tesla.png',
        price: 70000,
        description: 'Electric luxury car with autopilot and long range.',
        transmission: 'Automatic',
        bodyType: 'Sedan',
        highway: 'Electric Range 600km',
        engine: 'Dual Motor',
        exteriorColor: 'Silver',
        fuelType: 'Electric',
      ),
    ];
  }

  /// Toggle favorite
  void onFavoritePressed(int index) {
    setState(() {
      final car = cars[index];
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
        elevation: 0,
        toolbarHeight: 80,
        titleSpacing: 1,
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
                /// NOTIFICATIONS
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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

                /// POPUP MENU
                PopupMenuButton<String>(
                  icon: const CircleIconButtonWidget(icon: Icons.more_vert),
                  color: Colors.teal.shade900,
                  position: PopupMenuPosition.under,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's Find Your Favorite Car Here",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 15),
              SearchBarWidget(),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending Brands",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
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
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    return CarCardWidget(
                      carModel: cars[index],
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

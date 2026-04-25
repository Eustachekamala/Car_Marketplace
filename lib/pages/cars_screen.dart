import 'package:car_marketplace/data/favorite_store.dart';
import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/widgets/car_card_widget.dart';
import 'package:car_marketplace/widgets/circle_icon_button_widget.dart';
import 'package:car_marketplace/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  late List<CarModel> allCars;
  late List<CarModel> filteredCars;

  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "SUV",
    "Sedan",
    "Electric",
  ];

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

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;

      if (filter == "All") {
        filteredCars = List.from(allCars);
      } else if (filter == "Electric") {
        filteredCars = allCars
            .where((car) => car.fuelType == "Electric")
            .toList();
      } else {
        filteredCars = allCars
            .where((car) => car.bodyType == filter)
            .toList();
      }
    });
  }

  Widget buildFilterChip(String title) {
    final isSelected = selectedFilter == title;

    return GestureDetector(
      onTap: () => applyFilter(title),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : Colors.white.withAlpha(20),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? Colors.white
                : Colors.white.withAlpha(51),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.black
                : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleIconButtonWidget(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            /// SEARCH BAR
            SearchBarWidget(
              allCars: allCars,
              onResults: (results) {
                setState(() {
                  filteredCars = results;
                });
              },
            ),

            const SizedBox(height: 20),

            /// FILTERS
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: filters
                    .map((filter) => buildFilterChip(filter))
                    .toList(),
              ),
            ),

            const SizedBox(height: 20),

            /// CARS LIST
            Expanded(
              child: ListView.builder(
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  return CarCardWidget(
                    carModel: filteredCars[index],
                    onFavoritePressed: () =>
                        onFavoritePressed(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
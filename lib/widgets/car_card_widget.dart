import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/pages/car_details_screen.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel carModel;
  const CarCardWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(carModel: carModel),
          ),
        );
      },
      child: Container(
        height: 280,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.teal.shade900, Colors.teal.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(40),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 36,
                  width: 36,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(20),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(carModel.imagePath),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carModel.brandName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "${carModel.year} | ${carModel.location}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            Expanded(
              child: Center(
                child: Image.asset(carModel.imagePath, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

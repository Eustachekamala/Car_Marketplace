import 'package:flutter/material.dart';

class BrandBadgeWidget extends StatelessWidget {
  final String imagePath;
  final String brandName;

  const BrandBadgeWidget({
    super.key,
    required this.imagePath,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // TODO View Brand
          },
          borderRadius: BorderRadius.circular(50),
          child: Ink(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(12),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white.withAlpha(21)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          brandName,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
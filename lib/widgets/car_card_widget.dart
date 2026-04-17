import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/pages/car_details_screen.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatefulWidget {
  final CarModel carModel;
  final VoidCallback onFavoritePressed;
  const CarCardWidget({
    super.key,
    required this.carModel,
    required this.onFavoritePressed,
  });

  @override
  State<CarCardWidget> createState() => _CarCardWidgetState();
}

class _CarCardWidgetState extends State<CarCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarDetailsScreen(carModel: widget.carModel),
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
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(20),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            widget.carModel.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// Text section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.carModel.brandName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 4),

                              Text(
                                "${widget.carModel.year} | ${widget.carModel.location}",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(20),
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: widget.onFavoritePressed,
                        child: Center(
                          child: Icon(
                            (widget.carModel.isFavorite ?? false)
                                ? Icons.favorite_rounded
                                : Icons.favorite_border,
                            size: 20,
                            color: (widget.carModel.isFavorite ?? false)
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Expanded(
                child: Center(
                  child: Image.asset(widget.carModel.imagePath, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

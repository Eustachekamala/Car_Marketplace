import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/widgets/double_circle_detail_icon_detail_widget.dart';
import 'package:flutter/material.dart';

class DetailFuelTypeWidget extends StatelessWidget {
  final IconData icon;
  final CarModel carModel;
  const DetailFuelTypeWidget({super.key, required this.icon, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DoubleCircleDetailIconDetailWidget(icon: icon),
        const SizedBox(height: 10),
        Text('Fuel Type', style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Colors.white.withAlpha(160)
        ),),
        const SizedBox(height: 10),
        Text(carModel.fuelType ?? '', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Colors.white
        ),),
      ],
    );
  }
}

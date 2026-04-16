import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/widgets/circle_icon_button_widget.dart';
import 'package:car_marketplace/widgets/container_price_widget.dart';
import 'package:car_marketplace/widgets/detail_body_type_widget.dart';
import 'package:car_marketplace/widgets/detail_engine_widget.dart';
import 'package:car_marketplace/widgets/detail_exterior_color_widget.dart';
import 'package:car_marketplace/widgets/detail_fuel_type_widget.dart';
import 'package:car_marketplace/widgets/detail_highway_widget.dart';
import 'package:car_marketplace/widgets/detail_transmission_widget.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final CarModel carModel;

  const CarDetailsScreen({super.key, required this.carModel});

  Widget _divider() {
    return Container(
      width: 1,
      height: 50,
      color: Colors.white24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          carModel.brandName,
          style: const TextStyle(color: Colors.white),
        ),

        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleIconButtonWidget(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: PopupMenuButton<String>(
              icon: const CircleIconButtonWidget(icon: Icons.more_vert),
              color: Colors.teal.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              position: PopupMenuPosition.under,
              onSelected: (value) {},
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'share', child: Text('Share')),
                PopupMenuItem(
                  value: 'favorite',
                  child: Text('Add to Favorite'),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 80),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              carModel.imagePath,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF103F35),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// CAR NAME
                    Text(
                      carModel.brandName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: DetailHighwayWidget(
                            icon: Icons.speed,
                            carModel: carModel,
                          ),
                        ),

                        const SizedBox(width: 10),
                        _divider(),
                        const SizedBox(width: 10),

                        Expanded(
                          child: DetailTransmissionWidget(
                            icon: Icons.settings,
                            carModel: carModel,
                          ),
                        ),

                        const SizedBox(width: 10),
                        _divider(),
                        const SizedBox(width: 10),

                        Expanded(
                          child: DetailEngineWidget(
                            icon: Icons.precision_manufacturing,
                            carModel: carModel,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: DetailBodyTypeWidget(
                            icon: Icons.directions_car,
                            carModel: carModel
                          ),
                        ),
                        const SizedBox(width: 10),
                        _divider(),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DetailExteriorColorWidget(
                            icon: Icons.palette, 
                            carModel: carModel
                          )
                        ),
                        const SizedBox(width: 10),
                        _divider(),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DetailFuelTypeWidget(
                            icon: Icons.local_gas_station, 
                            carModel: carModel
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(carModel.description ?? '', style: TextStyle(
                      color: Colors.white.withAlpha(127),
                    ),),
                    const SizedBox(height: 20),
                    ContainerPriceWidget(carModel: carModel)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';

class ContainerPriceWidget extends StatelessWidget {
  final CarModel carModel;
  const ContainerPriceWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.teal.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.white.withAlpha(160),
                ),
              ),
              Text(
                '\$${carModel.price.toString()}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Visit Store',
                  border: Border.all(
                    color: Colors.white.withAlpha(60),
                    width: 2,
                  ),
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyButtonWidget(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xFF103F35),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Handle bar
                              Center(
                                child: Container(
                                  width: 50,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// Title
                              const Text(
                                "Confirm Purchase",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "Are you sure you want to buy this car?",
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 20),

                              /// Buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: MyButtonWidget(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: "Cancel",
                                      color: Colors.white10,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: MyButtonWidget(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // TODO: add purchase logic
                                      },
                                      text: "Buy Now",
                                      color: Colors.white,
                                      textColor: Colors.black,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: 'Buy Now',
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

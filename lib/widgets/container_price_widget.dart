import 'package:car_marketplace/model/car_model.dart';
import 'package:car_marketplace/utils/app_sheet.dart';
import 'package:car_marketplace/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';

class ContainerPriceWidget extends StatelessWidget {
  final CarModel carModel;

  const ContainerPriceWidget({
    super.key,
    required this.carModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.teal.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// PRICE ROW
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
                '\$${carModel.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          /// BUTTONS
          Row(
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
                    AppSheet.show(
                      context: context,
                      title: "Confirm Purchase",
                      message:
                          "Are you sure you want to buy ${carModel.brandName}?",
                      primaryText: "Buy Now",
                      secondaryText: "Cancel",
                      onPrimaryPressed: () {
                        // TODO: purchase logic
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
import 'package:car_marketplace/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';

class AppBottomModalSheetWidget extends StatelessWidget {
  final String title;
  final String? message;
  final String? primaryText;
  final String? secondaryText;
  final VoidCallback onPrimaryPressed;
  const AppBottomModalSheetWidget({
    super.key,
    required this.title,
    this.message,
    this.primaryText,
    this.secondaryText,
    required this.onPrimaryPressed,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          /// Message
          Text(message ?? '', style: const TextStyle(color: Colors.white70)),

          const SizedBox(height: 20),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: MyButtonWidget(
                  onPressed: () => Navigator.pop(context),
                  text: secondaryText ?? '',
                  color: Colors.white10,
                  textColor: Colors.white,
                  border: Border.all(
                    color: Colors.white.withAlpha(60),
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    onPrimaryPressed();
                  },
                  text: primaryText ?? '',
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
  }
}

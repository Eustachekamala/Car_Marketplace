import 'package:car_marketplace/widgets/circle_icon_button_widget.dart';
import 'package:flutter/material.dart';

class FavoritesCarScreen extends StatelessWidget {
  const FavoritesCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Favorites Cars'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleIconButtonWidget(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: const Center(
        child: Text('This is the favorites cars screen'),
      ),
    );
  }
}
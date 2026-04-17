import 'package:flutter/material.dart';

class FavoritesCarScreen extends StatelessWidget {
  const FavoritesCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Cars'),
      ),
      body: const Center(
        child: Text('This is the favorites cars screen'),
      ),
    );
  }
}
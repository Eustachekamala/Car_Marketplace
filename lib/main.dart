import 'package:car_marketplace/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Marketplace',

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        scaffoldBackgroundColor: const Color(0xFF0E5546),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0E5546),
          elevation: 0,
          foregroundColor: Colors.white,
        ),

        colorScheme: ColorScheme.dark(
          primary: Color(0xFF0E5546),
        ),
      ),

      home: const OnboardingScreen(),
    );
  }
}
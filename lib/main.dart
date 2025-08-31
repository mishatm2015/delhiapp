import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'config/app_config.dart';

void main() {
  runApp(const SouthIndianFoodApp());
}

class SouthIndianFoodApp extends StatelessWidget {
  const SouthIndianFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'South Indian Food',
      debugShowCheckedModeBanner: false,
      theme: AppConfig.lightTheme,
      home: const HomeScreen(),
    );
  }
}

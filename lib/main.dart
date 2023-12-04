import 'package:flutter/material.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import 'package:untitled1/Screens/HoroscopeDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ZodiacAppWorkingDir',
      home: HoroscopeDetailsScreen(),
    );
  }
}

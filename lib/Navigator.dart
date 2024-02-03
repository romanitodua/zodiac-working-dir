import 'package:flutter/material.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import 'package:untitled1/Screens/HoroscopeDetailsScreen.dart';
import 'package:untitled1/Screens/ZodiacDetails.dart';

import 'Screens/Settings/Settings.dart';

class MyNavigator extends StatefulWidget {
  const MyNavigator({super.key});

  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  final List<Widget> _pages = [const HomeScreen(), const ZodiacDetails(), const Settings()];
  int start_page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: start_page,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() {
          start_page = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "DetailsScreen"),
          BottomNavigationBarItem(icon: Icon(Icons.details), label: "Details"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
      body: _pages[start_page],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled1/Compatibility/CompatibilityChooser.dart';
import 'package:untitled1/Screens/Selection/Selection.dart';
import 'package:untitled1/Screens/HoroscopeDetailsScreen.dart';
import 'package:untitled1/Screens/ZodiacDetails.dart';

import 'Compatibility/CompatibilityDetails.dart';
import 'Screens/Settings/Settings.dart';

class MyNavigator extends StatefulWidget {
  const MyNavigator({super.key});

  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  final List<Widget> _pages = [
    const SelectionPage(),
    const ZodiacDetails(),
    const Settings(),
    const CompatibilityDetails(),
    const CompatibilityChooser()
  ];
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
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.animation), label: "animation"),
          BottomNavigationBarItem(icon: Icon(Icons.keyboard_option_key,),label: "Chooser")
        ],
      ),
      body: _pages[start_page],
    );
  }
}

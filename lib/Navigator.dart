import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/Compatibility/CompatibilityChooser.dart';
import 'package:untitled1/Screens/Selection/selection_of_day_sign.dart';
import 'package:untitled1/home_page/home_page.dart';
import 'package:untitled1/settings_page/settings.dart';

class MyNavigator extends StatefulWidget {
  const MyNavigator({super.key});

  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  final List<Widget> _pages = [
    const Testing(),
    const HomePage(),
    const SelectionPage(),
    const CompatibilityChooser(),
    const Settings(),
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
              icon: Icon(Icons.transfer_within_a_station), label: "testing"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.wpexplorer), label: "Explore"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.puzzlePiece),
              label: "Compatibility"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
      body: _pages[start_page],
    );
  }
}

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("click")),
      ),
    );
  }
}

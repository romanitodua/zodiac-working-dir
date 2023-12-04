import 'package:flutter/material.dart';

class HoroscopeDetailsScreen extends StatefulWidget {
  const HoroscopeDetailsScreen({super.key});

  @override
  State<HoroscopeDetailsScreen> createState() => _HoroscopeDetailsScreenState();
}

class _HoroscopeDetailsScreenState extends State<HoroscopeDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            appBar: null,
            body: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/test.jpg'))),
                ),
                const Center(
                  child: Text(
                    'Aries',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Center(
                  child: Text(
                    '13Mar-20Mar',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )));
  }
}

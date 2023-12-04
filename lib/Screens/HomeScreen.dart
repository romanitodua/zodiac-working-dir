import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: innerBoxIsScrolled
                        ? const Text(
                            'Choose Your Horoscope',
                            style: TextStyle(color: Colors.black),
                          )
                        : null,
                    background: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const ClipOval(
                            child: Image(
                              image: AssetImage('assets/moon.png'),
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text("1/12/2023"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Moon Phase-PlaceHoldersadsadsadadsdadas"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  // Border for visualization
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButton<String>(
                                  value: 'Option 1', // Set the default value
                                  onChanged: (String? newValue) {
                                    // Handle selection change
                                  },
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: dayPicker(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: const Text('Select you Sign',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'RobotoMono')),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: astrologySigns(),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: astrologySigns(),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: astrologySigns(),
                )
              ],
            )),
      ),
    );
  }

  List<Widget> dayPicker() {
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return List.generate(
      31,
      (index) => Column(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text((index + 1).toString()),
            ),
          ),
          Text(
            daysOfWeek[index % 7],
            // Modulo 7 to cycle through days of the week
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  List<Widget> astrologySigns() {
    return List.generate(
      3,
      (index) => Column(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(
                'assets/astrology-aries.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Aries',
            // Modulo 7 to cycle through days of the week
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

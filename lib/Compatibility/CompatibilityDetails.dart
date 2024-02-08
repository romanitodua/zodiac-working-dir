import 'package:flutter/material.dart';

import '../Utils/Extensions.dart';

class CompatibilityDetails extends StatefulWidget {
  const CompatibilityDetails({super.key});

  @override
  _CompatibilityDetailsState createState() => _CompatibilityDetailsState();
}

class _CompatibilityDetailsState extends State<CompatibilityDetails> with Responsive {
  late double initialPosition;
  double opacity = 0.0;

  @override
  void initState() {
    initialPosition = screenHeight / 3;
    super.initState();
    startAnimation();
    startFade();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startAnimation() async {
    await Future.delayed(
        const Duration(microseconds: 500)); // Delay for 1 second
    setState(() {
      initialPosition = 0;
    });
  }

  void startFade() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        AnimatedPositioned(
          curve: Curves.elasticIn,
          duration: Duration(seconds: 2), // Animation duration
          top: initialPosition,
          child: Container(
            width: screenWidth,
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Expanded(child: Image.asset('assets/astrology-aries.png')),
                    Text("Aries"),
                    Text("12-12-2002")
                  ],
                ),
                Icon(Icons.plus_one,size: 30,),
                Column(
                  children: [
                    Expanded(child: Image.asset('assets/astrology-aries.png')),
                    Text("Aries"),
                    Text("12-12-2002")
                  ],
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: AnimatedOpacity(
            curve: Curves.easeInBack,
            opacity: opacity,
            duration: Duration(seconds: 1),
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1 + 10),
              child: const Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.heart_broken_sharp),
                      title: Text('Relationship'),
                      trailing: Text(
                        "95%",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.work),
                      title: Text('Career/Work'),
                      trailing: Text(
                        "95%",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.location_pin),
                      title: Text('Sex Life'),
                      trailing: Text(
                        "95%",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text('Marriage'),
                      trailing: Text(
                        "95%",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.mobile_friendly),
                      title: Text('Friendship'),
                      trailing: Text(
                        "95%",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

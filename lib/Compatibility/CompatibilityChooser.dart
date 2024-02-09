import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Utils/Extensions.dart';

class CompatibilityChooser extends StatefulWidget {
  const CompatibilityChooser({super.key});

  @override
  State<CompatibilityChooser> createState() => _CompatibilityChooserState();
}

class _CompatibilityChooserState extends State<CompatibilityChooser>
    with Responsive {
  PageController pageController = PageController(viewportFraction: 0.8);

  List<Widget> children = [
    'assets/astrology-aries.png',
    'assets/moon.png',
    'assets/test.jpg'
  ].map((e) => Container(child: Image.asset(e))).toList();

  @override
  void initState() {
    List<Widget> children = [
      'assets/astrology-aries.png',
      'assets/moon.png',
      'assets/test.jpg'
    ]
        .map((e) => Container(
            width: screenWidth / 3,
            height: screenHeight / 3,
            child: Image.asset(e,fit: BoxFit.cover,)))
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Multiple item in one slide demo')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: children,
              ),
            ),
            Expanded(child: Center(child: Container(
              width: 100,
              height: 100,
              child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
            ),)),
            Expanded(
              child: PageView(
                children: children,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(onPressed: () =>print(pageController.page),style:  ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple,
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(screenWidth/2, screenHeight/15), //////// HERE
              ), child: Text("Check Compatibility",style: TextStyle(
                fontWeight: FontWeight.bold
              ),),),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:untitled1/Utils/extensions.dart';
import 'package:untitled1/Utils/constants.dart';

class CompatibilityChooser extends StatefulWidget {
  const CompatibilityChooser({super.key});

  @override
  State<CompatibilityChooser> createState() => _CompatibilityChooserState();
}

class _CompatibilityChooserState extends State<CompatibilityChooser>
    with Responsive {
  PageController pageController = PageController(viewportFraction: 0.8);

  List<Widget> children =
      allSigns.map((e) => Image.asset(e.assetPicture)).toList();

  @override
  void initState() {
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
        appBar: AppBar(title: const Text('Align the two signs below each other')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: children,
              ),
            ),
            Expanded(
                child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                ),
                child: const Center(
                    child: Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                )),
              ),
            )),
            Expanded(
              child: PageView(
                children: children,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize:
                      Size(screenWidth / 2, screenHeight / 15), //////// HERE
                ),
                child: const Text(
                  "Check Compatibility",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}

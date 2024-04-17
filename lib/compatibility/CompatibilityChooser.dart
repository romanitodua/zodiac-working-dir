import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/Compatibility/CompatibilityDetails.dart';
import 'package:untitled1/Utils/extensions.dart';
import 'package:untitled1/Utils/constants.dart';

class CompatibilityChooser extends StatefulWidget {
  const CompatibilityChooser({super.key});

  @override
  State<CompatibilityChooser> createState() => _CompatibilityChooserState();
}

class _CompatibilityChooserState extends State<CompatibilityChooser>
    with Responsive {
  PageController firstPageController = PageController(viewportFraction: 0.6);
  PageController secondPageController = PageController(viewportFraction: 0.6);

  late List<Widget> children;

  @override
  void initState() {
    super.initState();
    children = allSigns
        .map((e) => Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.15),
                      child: Image.asset(
                        e.logoPicture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(child: Text(e.name))
                ],
              ),
            ))
        .toList();
  }

  @override
  void dispose() {
    firstPageController.dispose();
    secondPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Align the two signs below each other')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: firstPageController,
                children: children,
              ),
            ),
            const Expanded(
                child: Center(
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.plus,
                size: 50,
              )),
            )),
            Expanded(
              child: PageView(
                controller: secondPageController,
                children: children,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompatibilityDetails(
                            firstPageController.page!.floor(),
                            secondPageController.page!.floor())),
                  )
                },
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

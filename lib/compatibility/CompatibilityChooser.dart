
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
  int _currentIndexFP = 0;
  int _currentIndexSP = 0;

  @override
  void initState() {
    super.initState();
    children = allSigns
        .map((e) => Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.15),
                    child: Image.asset(
                      e.logoPicture,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(child: Text(e.name,style: TextStyle(
                    color: Colors.white
                  ),))
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
        appBar: AppBar(
          title: const Text('Align the two signs below each other'),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/comp-background.png'),
                  fit: BoxFit.fill)),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: firstPageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndexFP = index % children.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    return children[index % children.length];
                  },
                ),
                // child: PageView(
                //   controller: secondPageController,
                //   children: children,
                // ),
              ),
              Center(
                  child: FaIcon(
                FontAwesomeIcons.plus,
                size: 50,
              )),
              Expanded(
                child: PageView.builder(
                  controller: secondPageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndexSP = index % children.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    return children[index % children.length];
                  },
                ),
                // child: PageView(
                //   controller: secondPageController,
                //   children: children,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompatibilityDetails(
                              _currentIndexFP, _currentIndexSP)),
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
          ),
        ));
  }
}

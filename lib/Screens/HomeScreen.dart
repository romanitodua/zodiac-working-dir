import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int current_day;
  List<bool> selected_index = List.generate(31, (index) => false);

  @override
  void initState() {
    current_day = DateTime.now().day;
    selected_index[current_day-1] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Placeholder(),
            SizedBox(
              height: 60,
              child: ScrollablePositionedList.builder(
                  initialAlignment: 0.5,
                  initialScrollIndex: current_day,
                  scrollDirection: Axis.horizontal,
                  itemCount: 31,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected_index.fillRange(0, 31, false);
                            selected_index[index] = true;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: selected_index[index] ?Colors.white:Color.fromRGBO(73,74,78, 1),
                          child: Center(
                              child: Text((index+1).toString(),
                                  style: TextStyle(
                                    color: selected_index[index] ?Colors.black:Color.fromRGBO(113,113,117,1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }

  List<Widget> days = List.generate(31, (index) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.red,
      child: Center(
          child: Text("1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  });
}

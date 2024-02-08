import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late int current_day;
  List<bool> selected_index = List.generate(31, (index) => false);

  @override
  void initState() {
    current_day = DateTime.now().day;
    selected_index[current_day - 1] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(10),child: Text("Select the day"))),
            SliverToBoxAdapter(
              child: SizedBox(
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
                            backgroundColor: selected_index[index]
                                ? Colors.white
                                : Color.fromRGBO(73, 74, 78, 1),
                            child: Center(
                                child: Text((index + 1).toString(),
                                    style: TextStyle(
                                        color: selected_index[index]
                                            ? Colors.black
                                            : Color.fromRGBO(113, 113, 117, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(10),child: Text("Select your sign"))),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Align content with spacing
                    children: [
                      const Text('Text 1',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const Text('Text 2', style: TextStyle(fontSize: 16)),
                      Expanded(
                          child: Image.asset('assets/astrology-aries.png')),
                      // Photo at the bottom
                    ],
                  ),
                ),
                childCount: 12,
              ),
            ),
          ],
        ),
      ),
    );
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/Networking/Provider.dart';
import 'package:untitled1/data/ZodiacDetailProvider.dart';

import 'Selection/Selection.dart';

class ZodiacDetails extends ConsumerStatefulWidget {
  const ZodiacDetails({super.key});

  @override
  ConsumerState createState() => _ZodiacDetailsState();
}

class _ZodiacDetailsState extends ConsumerState<ZodiacDetails> {
  late int choiceChip_selected;
  List<bool> _isSelected = List.filled(2, false);

  @override
  void initState() {
    choiceChip_selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var zodiac = ref.watch(fetchDetailsProvider);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.asset('assets/moon.png', fit: BoxFit.fill),
                width: size.width,
                height: size.height * 0.3,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Aries",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w900, fontSize: 30),
              )),
              Center(
                  child: Text(
                "13Mar-20Mar",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceChip(
                    showCheckmark: false,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    label: const Text("Daily"),
                    selected: choiceChip_selected == 0,
                    onSelected: (bool selected) {
                      setState(() {
                        choiceChip_selected = 0;
                      });
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    label: const Text("Weekly"),
                    selected: choiceChip_selected == 1,
                    onSelected: (bool selected) {
                      setState(() {
                        choiceChip_selected = 1;
                      });
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    label: const Text("Monthly"),
                    selected: choiceChip_selected == 2,
                    onSelected: (bool selected) {
                      setState(() {
                        choiceChip_selected = 2;
                      });
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    label: const Text("Yearly"),
                    selected: choiceChip_selected == 3,
                    onSelected: (bool selected) {
                      setState(() {
                        choiceChip_selected = 3;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ToggleButtons(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(73, 74, 78, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("1",
                          style: TextStyle(
                              fontSize: 25,
                              color: _isSelected[0]
                                  ? Colors.white
                                  : Color.fromRGBO(255, 255, 255, 0.5))),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(73, 74, 78, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("2", style: TextStyle(fontSize: 25)),
                    ),
                  )
                ],
                isSelected: _isSelected,
                onPressed: (s) {
                  _isSelected[s] = true;
                  setState(() {});
                },
                selectedColor: Colors.white,
              ),
              Builder(builder: (context) {
                return zodiac.when(
                  data: (data) => Text(data.descriptionDaily!),
                  error: (error, stack) =>
                      Text('Oops, something unexpected happened'),
                  loading: () => CircularProgressIndicator(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

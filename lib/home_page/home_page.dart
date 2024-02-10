import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/Utils/extensions.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin, Responsive {
  late TabController tabController;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    formattedDate = DateFormat('MMMM, d y').format(now);
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            formattedDate,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: Column(
          children: [
            const Card(
              elevation: 2,
              shadowColor: Colors.grey,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/test.jpg') as ImageProvider,
                    radius: 48,
                  ),
                  IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sun Sign"),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.white,
                        ),
                        Text("Aquarius"),
                        Column(
                          children: [
                            Text("Moon Sign"),
                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Colors.white,
                            ),
                            Text("Aries")
                          ],
                        )
                      ],
                    ),
                  ),
                  IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ascendent"),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.white,
                        ),
                        Text("Pisces"),
                        Column(
                          children: [
                            Text("Element "),
                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Colors.white,
                            ),
                            Text("Air")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 35,
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Today",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Year",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TabBarView(controller: tabController, children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          elevation: 2,
                          shadowColor: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                animationDuration: 3000,
                                curve: Curves.bounceIn,
                                radius: screenWidth / 7,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.8,
                                center: Text(
                                  "80.0% \n Health",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                              CircularPercentIndicator(
                                animationDuration: 3000,
                                curve: Curves.bounceIn,
                                radius: screenWidth / 7,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.8,
                                center: Text(
                                  "80.0% \n Health",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                              CircularPercentIndicator(
                                animationDuration: 3000,
                                curve: Curves.bounceIn,
                                radius: screenWidth / 7,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.8,
                                center: Text(
                                  "80.0% \n Health",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Card(
                          child: ListTile(
                            leading: Text(
                              "Motto",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Text("Self-Control",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 6,),
                        Card(child: Text("JKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsJKSDHSKJDHSKJDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsSSSs"),
                          elevation: 5,shadowColor: Colors.grey,)
                      ],
                    ),
                  ),
                  Text("this is second")
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

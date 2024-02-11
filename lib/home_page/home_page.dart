import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/Networking/Provider.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/dart_classes/home_page_content_class.dart';
import 'package:untitled1/Utils/extensions.dart';
import 'package:untitled1/no_network_providers/default_sign_provider.dart';

import '../Utils/dart_classes/zodiac_classes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin, Responsive {
  late TabController tabController;
  late String formattedDate;
  ZodiacSign chosenSign = allSigns[0];

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
    int defaultSign = ref.watch(defaultSignProvider);
    print(defaultSign);
    if (0 > defaultSign) {
      print("aq");
      return defaultSignNotChosen(false);
    }

    print("called");
    AsyncValue<HomePageContent> signContents =
        ref.watch(fetchHomePageContentProvider(sign: defaultSign));
    return signContents.when(data: (data) {
      print("movedit aqa");
      return signChosenDisplayContent(data);
    }, error: (error, stack) {
      print(error);
      return defaultSignNotChosen(true);
    }, loading: () {
      print("loading");
      return defaultSignNotChosen(true);
    });
  }

  Widget signChosenDisplayContent(HomePageContent data) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        body: Column(
          children: [
            cardForSignChosen(),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 35,
              child: TabBar(
                controller: tabController,
                tabs: const [
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
                    gradient: const LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TabBarView(controller: tabController, children: [
                  tabBarForChosenSign(data, true),
                  tabBarForChosenSign(data, false),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget defaultSignNotChosen(bool loading) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        body: Column(
          children: [
            cardForNoSignChosen(loading),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 35,
              child: TabBar(
                controller: tabController,
                tabs: const [
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
                    gradient: const LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TabBarView(controller: tabController, children: [
                  tabBarForNoSignChosen(),
                  tabBarForNoSignChosen()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: Text(
        formattedDate,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget tabBarForNoSignChosen() {
    return SingleChildScrollView(
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
                  percent: 0.1,
                  center: const Text(
                    "?% \n Health",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                  percent: 0.1,
                  center: const Text(
                    "?% \n Career",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                  percent: 0.1,
                  center: const Text(
                    "?% \n Health",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Card(
            child: ListTile(
              leading: Text(
                "Motto",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text("None",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.grey,
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
                "Choose your Sign",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tabBarForChosenSign(HomePageContent data, bool today) {
    return SingleChildScrollView(
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
                  percent: today
                      ? double.parse(data.todayCareer!) / 100
                      : double.parse(data.yearCareer!) / 100,
                  center: Text(
                    today
                        ? "${data.todayCareer!}\nCareer"
                        : "${data.yearCareer!}\nCareer",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
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
                  percent: today
                      ? double.parse(data.todayHealth!) / 100
                      : double.parse(data.yearHealth!) / 100,
                  center: Text(
                    today
                        ? "${data.todayHealth!}\nHealth"
                        : "${data.yearHealth!}\nHealth",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
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
                  percent: today ? double.parse(data.todayLove!) / 100 : double.parse(data.yearLove!) / 100,
                  center: Text(
                    today
                        ? "${data.todayLove!}\nLove"
                        : "${data.yearLove!}\nLove",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Card(
            child: ListTile(
              leading: const Text(
                "Motto",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(today ? data.todayMoto! : data.yearMoto!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.grey,
            child: Text(today ? data.todayDescription! : data.yearDescription!),
          )
        ],
      ),
    );
  }

  Widget cardForSignChosen() {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(chosenSign.assetPicture),
            radius: 48,
          ),
          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sun Sign"),
                const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
                Text(chosenSign.sunSign),
                Column(
                  children: [
                    const Text("Moon Sign"),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text(chosenSign.moonSign)
                  ],
                )
              ],
            ),
          ),
          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ascendant"),
                const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
                Text(chosenSign.ascendant),
                Column(
                  children: [
                    const Text("Element"),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text(chosenSign.element)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardForNoSignChosen(bool loading) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/question.jpg'),
            radius: 48,
          ),
          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sun Sign"),
                const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
                Text(loading ? "None" : chosenSign.sunSign),
                Column(
                  children: [
                    const Text("Moon Sign"),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text(loading ? "None" : chosenSign.moonSign)
                  ],
                )
              ],
            ),
          ),
          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ascendant"),
                const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
                Text(loading ? "None" : chosenSign.ascendant),
                Column(
                  children: [
                    const Text("Element"),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text(loading ? "None" : chosenSign.element)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

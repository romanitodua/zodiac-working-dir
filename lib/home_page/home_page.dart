import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/dart_classes/home_page_content_class.dart';
import 'package:untitled1/Utils/extensions.dart';
import 'package:untitled1/no_network_providers/default_sign_provider.dart';
import 'package:untitled1/settings_page/settings.dart';

import '../Utils/dart_classes/zodiac_classes.dart';
import '../providers/ad_state_provider.dart';
import '../providers/firebase_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin, Responsive {
  BannerAd? banner;
  late TabController tabController;
  late String formattedDate;
  late OfflineZodiacData chosenSign;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    formattedDate = DateFormat('MMMM, d y').format(now);
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    if (banner != null) {
      banner!.dispose();
    }
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final adState = ref.watch(adStateProvider);
    adState.initializationStatus.then((status) {
      setState(() {
        banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitID,
            listener: adState.adListener,
            request: const AdRequest())
          ..load();
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int day = DateTime.now().day;
    int defaultSign = ref.watch(defaultSignProvider);

    if (0 > defaultSign) {
      chosenSign = allSigns[0];
      return defaultSignNotChosen(false);
    }
    chosenSign = allSigns[defaultSign];

    AsyncValue<HomePageContent> signContents =
        ref.watch(fetchHomePageContentProvider(sign: defaultSign, day: day));
    return signContents.when(data: (data) {
      return signChosenDisplayContent(data);
    }, error: (error, stack) {
      return defaultSignNotChosen(true);
    }, loading: () {
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
            ),
            banner == null
                ? const SizedBox()
                : SizedBox(
                    height: 50,
                    child: AdWidget(
                      ad: banner!,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget defaultSignNotChosen(bool defaultChosen) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        body: Column(
          children: [
            defaultChosen ? cardForSignChosen() : cardForNoSignChosen(),
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
                    "Health",
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
                    "Career",
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
                    "Health",
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
            elevation: 0,
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
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
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
                  "Choose Your Sign",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                        ? "${data.todayCareer!}%\nCareer"
                        : "${data.yearCareer!}%\nCareer",
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
                        ? "${data.todayHealth!}%\nHealth"
                        : "${data.yearHealth!}%\nHealth",
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
                      ? double.parse(data.todayLove!) / 100
                      : double.parse(data.yearLove!) / 100,
                  center: Text(
                    today
                        ? "${data.todayLove!}%\nLove"
                        : "${data.yearLove!}%\nLove",
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
            backgroundColor: Colors.white,
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

  Widget cardForNoSignChosen() {
    return const Card(
      elevation: 2,
      shadowColor: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 48,
            child: Text(
              "?",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
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
                Text("None"),
                Column(
                  children: [
                    Text("Moon Sign"),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text("None")
                  ],
                )
              ],
            ),
          ),
          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ascendant"),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
                Text("None"),
                Column(
                  children: [
                    Text("Element"),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text("None")
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

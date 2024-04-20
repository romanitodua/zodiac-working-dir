import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/dart_classes/home_page_content_class.dart';
import 'package:untitled1/Utils/extensions.dart';
import 'package:untitled1/no_network_providers/default_sign_provider.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(defaultSign),
        body: Column(
          children: [
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
                  tabBarForChosenSign(true, defaultSign, day),
                  tabBarForChosenSign(false, defaultSign, day),
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

  AppBar myAppBar(int defaultSign) {
    return AppBar(
      actions: [
        DropdownMenu<int>(
            label: defaultSign < 0
                ? Text(
                    "Choose your Sign",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                : null,
            initialSelection: defaultSign >= 0 ? defaultSign : null,
            onSelected: (index) =>
                ref.read(defaultSignProvider.notifier).setSign(index!),
            inputDecorationTheme: const InputDecorationTheme(
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none),
            dropdownMenuEntries: allSigns.map((e) {
              return DropdownMenuEntry(
                  value: e.index,
                  label: e.name,
                  leadingIcon: ImageIcon(AssetImage(e.assetPicture)));
            }).toList()),
        defaultSign >= 0
            ? CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(allSigns[defaultSign].assetPicture))
            : SizedBox()
      ],
      title: Text(
        formattedDate,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget tabBarForChosenSign(bool today, int defaultSign, int day) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      AsyncValue<HomePageContent> signContents =
          ref.watch(fetchHomePageContentProvider(sign: defaultSign, day: day));
      return signContents.when(
          data: (data) => SingleChildScrollView(
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                      child: SelectableText(
                        today ? data.todayDescription! : data.yearDescription!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  ],
                ),
              ),
          error: (error, trace) => Center(
                child: Text(error.toString()),
              ),
          loading: () => Center(
                child: CircularProgressIndicator(),
              ));
    });
  }
}

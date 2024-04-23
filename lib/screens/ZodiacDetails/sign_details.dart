
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/dart_classes/firebase_details_class.dart';
import 'package:untitled1/providers/firebase_providers.dart';

import '../../Utils/extensions.dart';
import '../../providers/ad_state_provider.dart';

class SignDetails extends ConsumerStatefulWidget {
  final int signIndex;
  final int day;

  const SignDetails(this.signIndex, this.day, {super.key});

  @override
  ConsumerState createState() => _ZodiacDetailsState();
}

class _ZodiacDetailsState extends ConsumerState<SignDetails> with Responsive {
  Calendar segmentedButtonSelected = Calendar.day;
  BannerAd? banner;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (banner != null) {
      banner!.dispose();
    }
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * 0.8,
                height: screenWidth * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.15),
                  child: Image.asset(
                    allSigns[widget.signIndex].logoPicture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 86,
              ),
              Center(
                  child: Text(
                allSigns[widget.signIndex].name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w900, fontSize: 30),
              )),
              Center(
                  child: Text(
                allSigns[widget.signIndex].dateInterval,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              )),
              SizedBox(
                height: screenHeight / 86,
              ),
              Center(child: createSegmentedButtons()),
              SizedBox(
                height: screenHeight / 86,
              ),
              Consumer(builder: (builder, context, child) {
                AsyncValue<FireBaseDetails> zodiac = ref.watch(
                    fetchDetailsProvider(
                        sign: widget.signIndex, day: widget.day));
                return zodiac.when(
                  data: (data) {
                    Widget result = const Text("");
                    switch (segmentedButtonSelected) {
                      case Calendar.day:
                        result = Text(data.descriptionDaily!);
                        break;
                      case Calendar.week:
                        result = Text(data.descriptionWeekly!);
                        break;
                      case Calendar.month:
                        result = Text(data.descriptionMonthly!);
                        break;
                      case Calendar.year:
                        result = Text(data.descriptionYearly!);
                        break;
                    }
                    return Card(child: result);
                  },
                  error: (error, stack) =>
                      const Text('Oops, something unexpected happened'),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              }),
              SizedBox(
                height: 10,
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
      ),
    );
  }

  Widget createSegmentedButtons() {
    return SegmentedButton<Calendar>(
        showSelectedIcon: false,
        onSelectionChanged: (newSelection) {
          setState(() {
            segmentedButtonSelected = newSelection.first;
          });
        },
        segments: [
          ButtonSegment(
              value: Calendar.day,
              icon: Icon(Icons.calendar_view_day_sharp),
              label: Text("Daily")),
          ButtonSegment(
              value: Calendar.week,
              icon: Icon(Icons.calendar_view_week_sharp),
              label: Text("Weekly")),
          ButtonSegment(
              value: Calendar.month,
              icon: Icon(Icons.calendar_view_month_sharp),
              label: Text("Monthly")),
          ButtonSegment(
              value: Calendar.year,
              icon: Icon(Icons.calendar_today_sharp),
              label: Text("Yearly"))
        ],
        selected: <Calendar>{
          segmentedButtonSelected
        });
  }
}

enum Calendar { day, week, month, year }

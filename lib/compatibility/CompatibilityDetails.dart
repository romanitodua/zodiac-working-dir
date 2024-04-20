import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/dart_classes/firebase_compatibility_class.dart';
import 'package:untitled1/Utils/dart_classes/zodiac_classes.dart';
import '../Utils/extensions.dart';
import '../providers/firebase_providers.dart';

class CompatibilityDetails extends ConsumerStatefulWidget {
  final int firstSign;
  final int secondSign;

  const CompatibilityDetails(this.firstSign, this.secondSign, {super.key});

  @override
  ConsumerState createState() => _CompatibilityDetailsState();
}

class _CompatibilityDetailsState extends ConsumerState<CompatibilityDetails>
    with Responsive {
  late ValueNotifier<double> initialPosition;
  late ValueNotifier<double> opacityNotifier;
  late OfflineZodiacData firstSign;
  late OfflineZodiacData secondSign;

  @override
  void initState() {
    super.initState();
    initialPosition = ValueNotifier(screenHeight / 3);
    opacityNotifier = ValueNotifier(0);
    firstSign = allSigns[widget.firstSign];
    secondSign = allSigns[widget.secondSign];
  }

  @override
  void dispose() {
    initialPosition.dispose();
    opacityNotifier.dispose();
    super.dispose();
  }

  void startAnimation() async {
    await Future.delayed(const Duration(microseconds: 500));
    initialPosition.value = 0;
  }

  void startFade() async {
    await Future.delayed(const Duration(seconds: 2));
    opacityNotifier.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<FireBaseCompatibility> compatibilityResult = ref.watch(
        fetchCompatibilityProvider(
            firstSign: widget.firstSign, secondSign: widget.secondSign));

    return compatibilityResult.when(
        data: (data) {
          startAnimation();
          startFade();
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/comp-background.png'),
                      fit: BoxFit.fill)),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    ValueListenableBuilder<double>(
                      valueListenable: initialPosition,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return AnimatedPositioned(
                          curve: Curves.elasticIn,
                          duration: const Duration(seconds: 2),
                          // Animation duration
                          top: initialPosition.value,
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              width: screenWidth,
                              height: screenHeight * 0.1,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 0.15),
                                        child: Image.asset(
                                          firstSign.logoPicture,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                      Text(firstSign.name),
                                      Text(firstSign.dateInterval)
                                    ],
                                  ),
                                  const FaIcon(FontAwesomeIcons.plus),
                                  Column(
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 0.15),
                                        child: Image.asset(
                                          firstSign.logoPicture,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                      Text(secondSign.name),
                                      Text(secondSign.dateInterval)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: opacityNotifier,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return AnimatedOpacity(
                          curve: Curves.easeInBack,
                          opacity: opacityNotifier.value,
                          duration: const Duration(seconds: 1),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: screenHeight * 0.1 + 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: ListTile(
                                    leading:
                                        const FaIcon(FontAwesomeIcons.heart),
                                    title: const Text('Relationship'),
                                    trailing: Text(
                                      data.relationshipPerc!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    leading: const Icon(Icons.work),
                                    title: const Text('Career/Work'),
                                    trailing: Text(
                                      data.careerWorkPerc!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    leading: const FaIcon(
                                        FontAwesomeIcons.handHoldingHeart),
                                    title: const Text('Marriage'),
                                    trailing: Text(
                                      data.marriagePerc!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    leading: const FaIcon(
                                        FontAwesomeIcons.handHolding),
                                    title: const Text('Friendship'),
                                    trailing: Text(
                                      data.friendshipPerc!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SelectableText(
                                  "Relationship",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                SelectableText(
                                  data.relationshipDesc!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(),
                                ),
                                SelectableText(
                                  "Career/Work",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                SelectableText(
                                  data.careerWorkDesc!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(),
                                ),
                                SelectableText(
                                  "Marriage",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                SelectableText(
                                  data.careerWorkDesc!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(),
                                ),
                                SelectableText(
                                  "Friendship",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                SelectableText(
                                  data.careerWorkDesc!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ));
        },
        error: (error, stacktrace) => Scaffold(
              body: Center(
                child: Text(error.toString()),
              ),
            ),
        loading: () => Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}

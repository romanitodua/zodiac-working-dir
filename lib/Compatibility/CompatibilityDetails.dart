import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/Networking/Provider.dart';
import 'package:untitled1/Utils/dart_classes/compatibility_result.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/dart_classes/zodiac_classes.dart';

import '../Utils/extensions.dart';

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
  late ZodiacSign firstSign;
  late ZodiacSign secondSign;

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
    print("Rebuilt");
    AsyncValue<CompatibilityResult> compatibilityResult = ref.watch(
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
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  ValueListenableBuilder<double>(
                    valueListenable: initialPosition,
                    builder: (BuildContext context, double value, Widget? child) {
                      return AnimatedPositioned(
                        curve: Curves.elasticIn,
                        duration: const Duration(seconds: 2),
                        // Animation duration
                        top: initialPosition.value,
                        child: Card(
                          elevation: 2,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight * 0.1,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                        child:
                                            Image.asset(firstSign.assetPicture)),
                                    Text(firstSign.name),
                                    Text(firstSign.dateInterval)
                                  ],
                                ),
                                const FaIcon(FontAwesomeIcons.plus),
                                Column(
                                  children: [
                                    Expanded(
                                        child:
                                            Image.asset(secondSign.assetPicture)),
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
                                  leading: const FaIcon(FontAwesomeIcons.heart),
                                  title: const Text('Relationship'),
                                  trailing: Text(
                                    data.relationshipsPerc!,
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
                                  leading: const FaIcon(FontAwesomeIcons.handHoldingHeart),
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
                                  leading: const FaIcon(FontAwesomeIcons.handHolding),
                                  title: const Text('Friendship'),
                                  trailing: Text(
                                    data.friendshipPerc!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Relationship",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20

                              ),),
                              Text(data.relationshipDisc!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(



                              ),),
                              Text("Career/Work",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20

                              ),),
                              Text(data.careerWorkDisc!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(



                              ),),
                              Text("Marriage",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20

                              ),),
                              Text(data.marriageDisc!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(



                              ),),
                              Text("Friendship",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20

                              ),),
                              Text(data.friendshipDisc!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(



                              ),),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ));
        },
        error: (error, stacktrace) => const Text("print('');"),
        loading: () => Center(child: const CircularProgressIndicator()));
  }
}

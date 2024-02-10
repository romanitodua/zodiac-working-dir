import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/Networking/Provider.dart';
import 'package:untitled1/Utils/constants.dart';
import 'package:untitled1/Utils/sign_infromation.dart';

import '../../Utils/extensions.dart';

class SignDetails extends ConsumerStatefulWidget {
  final int signIndex;
  final int day;

  const SignDetails(this.signIndex, this.day, {super.key});

  @override
  ConsumerState createState() => _ZodiacDetailsState();
}

class _ZodiacDetailsState extends ConsumerState<SignDetails> with Responsive {
  late int choiceChipSelected;

  @override
  void initState() {
    super.initState();
    choiceChipSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<SignInformation> zodiac = ref.watch(fetchDetailsProvider(sign: widget.signIndex,day: widget.day));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.3,
                child: Image.asset(allSigns[widget.signIndex].assetPicture,
                    fit: BoxFit.fill),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createChoiceChip(
                    isSelected: choiceChipSelected == 0,
                    text: "Daily",
                    index: 0,
                  ),
                  createChoiceChip(
                    isSelected: choiceChipSelected == 1,
                    text: "Weekly",
                    index: 1,
                  ),
                  createChoiceChip(
                    isSelected: choiceChipSelected == 2,
                    text: "Monthly",
                    index: 2,
                  ),
                  createChoiceChip(
                    isSelected: choiceChipSelected == 3,
                    text: "Yearly",
                    index: 3,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 86,
              ),
              Consumer(builder: (builder, context, ref) {
                return zodiac.when(
                  data: (data) => Text(data.descriptionDaily!),
                  error: (error, stack) =>
                      const Text('Oops, something unexpected happened'),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget createChoiceChip(
      {required String text, required int index, required bool isSelected}) {
    return ChoiceChip(
      selectedColor: Colors.white,
      disabledColor: const Color.fromRGBO(73, 74, 78, 1),
      labelStyle: TextStyle(
          color: isSelected
              ? Colors.black
              : const Color.fromRGBO(113, 113, 117, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold),
      showCheckmark: false,
      padding: const EdgeInsets.only(left: 10, right: 10),
      label: Text(text),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          choiceChipSelected = index;
        });
      },
    );
  }
}

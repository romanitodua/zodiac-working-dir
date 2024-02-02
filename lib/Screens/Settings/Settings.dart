import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/test.dart';

import '../../Themes/theme_manager.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  List<ZodiacDropDownItem> row_list = ZodiacDropDownItem.rowList();
  late List<DropdownMenuItem<ZodiacDropDownItem>> _dropdown_list;

  @override
  void initState() {
    _dropdown_list = build_zodiac_dropdown_items();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var darkMode = ref.watch(myNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          Switch(
            value: darkMode,
            onChanged: (val) => ref.read(myNotifierProvider.notifier).toggle(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey),
                items: _dropdown_list,
                onChanged: (value) {
                  setState(() {});
                },
                // value: _chosen,
                hint: Text("Choose your Zodiac Sign",
                    style: darkMode
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white)
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<ZodiacDropDownItem>> build_zodiac_dropdown_items() {
    List<DropdownMenuItem<ZodiacDropDownItem>> result = [];
    for (ZodiacDropDownItem e in ZodiacDropDownItem.rowList()) {
      result.add(DropdownMenuItem<ZodiacDropDownItem>(
        value: e,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(e.name),
            Image.asset(
              e.img,
              width: 40,
            )
          ],
        ),
      ));
    }

    return result;
  }
}

class ZodiacDropDownItem {
  String img;
  String name;

  ZodiacDropDownItem(this.img, this.name);

  static List<ZodiacDropDownItem> rowList() {
    return [
      ZodiacDropDownItem('assets/astrology-aries.png', "Aries"),
      ZodiacDropDownItem('assets/astrology-aries.png', "Taurus"),
      ZodiacDropDownItem('assets/astrology-aries.png', "Cancer"),
      ZodiacDropDownItem('assets/astrology-aries.png', "Gemini"),
      ZodiacDropDownItem('assets/astrology-aries.png', "Libra"),
      ZodiacDropDownItem('assets/astrology-aries.png', "Scorpio")
    ];
  }
}

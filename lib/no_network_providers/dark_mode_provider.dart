import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dark_mode_provider.g.dart';


// dark mode notifier
@riverpod
class MyNotifier extends _$MyNotifier {
  late SharedPreferences prefs;

  MyNotifier() : super();

  @override
  bool build() {
    _init();
    return false;
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool("darkMode");
    state = darkMode ?? false;
  }

  void toggle() async {
    state = !state;
    prefs.setBool("darkMode", state);
  }
}

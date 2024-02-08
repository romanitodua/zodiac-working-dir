import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'test.g.dart';


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
    print("meore");
  }

  void toggle() async {
    print("called");
    state = !state;
    prefs.setBool("darkMode", state);
    print(state);
  }
}

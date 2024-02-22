import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untitled1/Utils/data_caching.dart';

part 'dark_mode_provider.g.dart';

// dark mode notifier
@riverpod
class MyNotifier extends _$MyNotifier {
  MyNotifier() : super();

  @override
  bool build() {
    return LocalStorage.preferences.getBool("darkMode") ?? false;
  }

  void toggle() async {
    state = !state;
    LocalStorage.preferences.setBool("darkMode", state);
  }
}

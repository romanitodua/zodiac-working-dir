import 'dart:ui';
import 'package:flutter/widgets.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    Brightness brightness = MediaQuery.of(this).platformBrightness;
    print("Called");
    print(brightness == Brightness.dark);
    return brightness == Brightness.dark;
  }
}

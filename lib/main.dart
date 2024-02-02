import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import 'package:untitled1/Screens/HoroscopeDetailsScreen.dart';
import 'package:untitled1/Screens/ZodiacDetails.dart';
import 'package:untitled1/Themes/theme_constants.dart';
import 'package:untitled1/Themes/theme_manager.dart';
import 'package:untitled1/test.dart';

import 'Navigator.dart';
import 'Screens/Settings/Settings.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(myNotifierProvider);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'ZodiacAppWorkingDir',
      home: const MyNavigator(),
    );
  }
}

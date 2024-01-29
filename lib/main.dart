import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import 'package:untitled1/Screens/HoroscopeDetailsScreen.dart';
import 'package:untitled1/Screens/Testing.dart';
import 'package:untitled1/Themes/theme_constants.dart';
import 'package:untitled1/Themes/theme_manager.dart';

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'ZodiacAppWorkingDir',
      home: Testing(),
    );
  }
}

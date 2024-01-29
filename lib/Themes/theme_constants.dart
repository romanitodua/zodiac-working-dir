import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    bodySmall: const TextStyle(color: Colors.black),
    bodyLarge: const TextStyle(color: Colors.black),
    bodyMedium: const TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
      bodySmall: const TextStyle(color: Colors.white),
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.white),
    ));

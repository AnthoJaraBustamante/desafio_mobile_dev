import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_theme.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: ThemeColor.primaryTint,
    appBarTheme: const AppBarTheme(
      color: ThemeColor.primary,
      centerTitle: true,
    ),
    primarySwatch: Colors.grey,
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Colors.white,
    ),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white.withOpacity(0.4),
      selectionHandleColor: Colors.white,
    ),
    // colorScheme: ThemeData().colorScheme.copyWith(
    //
    //     ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ThemeColor.primary,
      secondary: ThemeColor.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColor.primary,
        textStyle: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}

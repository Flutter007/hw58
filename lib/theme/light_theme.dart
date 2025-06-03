import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue.shade400);
final defaultTheme = ThemeData.light(useMaterial3: true);
final lightTheme = defaultTheme.copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.primaryContainer,
    foregroundColor: lightColorScheme.onPrimaryContainer,
  ),
  tabBarTheme: TabBarTheme().copyWith(
    indicatorColor: lightColorScheme.error,
    labelColor: lightColorScheme.error,
    unselectedLabelColor: lightColorScheme.onPrimaryContainer,
  ),

  inputDecorationTheme: InputDecorationTheme(
    focusColor: lightColorScheme.surface,
    errorStyle: TextStyle(color: lightColorScheme.error, fontSize: 18),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.error, width: 4),
    ),
    labelStyle: TextStyle(color: lightColorScheme.onSurface, fontSize: 22),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.surface, width: 4),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.surface, width: 4),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.onSurface, width: 4),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(textStyle: TextStyle(fontSize: 22)),
  snackBarTheme: SnackBarThemeData(contentTextStyle: TextStyle(fontSize: 18)),
  scaffoldBackgroundColor: lightColorScheme.inversePrimary,
  cardTheme: CardTheme().copyWith(color: lightColorScheme.surface),
  textTheme: GoogleFonts.afacadTextTheme(),
);

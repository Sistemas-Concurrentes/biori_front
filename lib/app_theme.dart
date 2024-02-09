import 'package:biori/pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Pallete.primaryColor),
    secondaryHeaderColor: Pallete.secondaryColor,
    scaffoldBackgroundColor: Pallete.scaffoldBackgroundColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Pallete.backgroundColor,
      selectedItemColor: Pallete.primaryColor,
      unselectedItemColor: Pallete.secondaryColor,
    ),
  );
}

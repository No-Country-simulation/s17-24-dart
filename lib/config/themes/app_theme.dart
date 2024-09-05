import 'package:flutter/material.dart';
import 'package:to_do_list_nocountry/config/consts/consts.dart';

// Definimos los colores principales para ambos temas
class AppColors {
  static const Color primaryColorLight = Color.fromARGB(255, 255, 255, 255);
  static const Color primaryColorDark = Color.fromARGB(255, 2, 3, 2);
  static const Color backgroundColorLight = Colors.white;
  static const Color backgroundColorDark = Colors.black;
  static const Color cardColorLight = Colors.grey;
  //static const Color cardColorDark = Colors.grey[800]!;
  static const Color textColorLight = Colors.black;
  static const Color textColorDark = Colors.white;
  static const Color hintColorLight = Colors.black;
  static const Color hintColorDark = Colors.grey;
}

class AppTheme {
  // Tema claro
  final ThemeData lightTheme = ThemeData(
    fontFamily: 'Georgia',
    primaryColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColorLight,
      foregroundColor: AppColors.textColorLight,
    ),
    cardColor: AppColors.cardColorLight,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorLight),
      bodyMedium: TextStyle(color: AppColors.textColorLight),
    ),
    iconTheme: const IconThemeData(color: AppColors.textColorLight),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardColorLight,
      hintStyle: TextStyle(color: AppColors.hintColorLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorLight,
        foregroundColor: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColorLight,
      onPrimary: Colors.white,
      secondary: Const.primaryColorTextOrange,
      onSecondary: AppColors.textColorLight,
      background: AppColors.backgroundColorLight,
      onBackground: AppColors.textColorLight,
      surface: AppColors.cardColorLight,
      onSurface: AppColors.textColorLight,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    ).copyWith(background: AppColors.backgroundColorLight),
  );

  // Tema oscuro
  final ThemeData darkTheme = ThemeData(
    fontFamily: 'Georgia',
    primaryColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColorDark,
      foregroundColor: AppColors.textColorDark,
    ),
    cardColor: Colors.grey[800]!,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorDark),
      bodyMedium: TextStyle(color: AppColors.textColorDark),
    ),
    iconTheme: const IconThemeData(color: AppColors.textColorDark),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800]!,
      hintStyle: TextStyle(color: AppColors.hintColorDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorDark,
        foregroundColor: Colors.white,
      ),
    ),
    colorScheme: ColorScheme(
      primary: AppColors.primaryColorDark,
      onPrimary: Colors.black,
      secondary: Const.primaryColorTextOrange,
      onSecondary: AppColors.textColorDark,
      background: AppColors.backgroundColorDark,
      onBackground: AppColors.textColorDark,
      surface: Colors.grey[800]!,
      onSurface: AppColors.textColorDark,
      error: Colors.red,
      onError: Colors.black,
      brightness: Brightness.dark,
    ).copyWith(background: AppColors.backgroundColorDark),
  );
}

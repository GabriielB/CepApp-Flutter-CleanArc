import 'package:cep_app/shared/ui/cep_app_colors.dart';
import 'package:flutter/material.dart';

sealed class CepAppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: CepAppColors.primaryColor,
      onPrimary: CepAppColors.primaryColor,
      secondary: CepAppColors.secondaryColor,
      onSecondary: CepAppColors.secondaryColor,
      error: CepAppColors.errorColor,
      onError: CepAppColors.errorColor,

      surface: CepAppColors.lightBgColor,
    ),
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: Colors.black.withValues(alpha: 0.3),
      labelColor: CepAppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CepAppColors.lightBgColor,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: CepAppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CepAppColors.primaryColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(CepAppColors.primaryColor),
      trackColor: WidgetStateProperty.all(CepAppColors.secondaryColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CepAppColors.primaryColor,
      foregroundColor: CepAppColors.whiteColor,
      titleTextStyle: TextStyle(
        color: CepAppColors.secondaryColor,
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: CepAppColors.lightBgColor,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: CepAppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(color: CepAppColors.blackColor, fontSize: 14),
      titleMedium: TextStyle(color: CepAppColors.blackColor, fontSize: 20),
    ),
  );

  // DarkTheme
  static final ThemeData dark = light.copyWith(
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: Colors.grey,
      labelColor: CepAppColors.primaryColor,
    ),
    appBarTheme: light.appBarTheme.copyWith(
      backgroundColor: Colors.black87,
      titleTextStyle: light.appBarTheme.titleTextStyle!.copyWith(
        color: CepAppColors.secondaryColor,
      ),
    ),
    scaffoldBackgroundColor: CepAppColors.darkBgColor,
    brightness: Brightness.dark,
    colorScheme: light.colorScheme.copyWith(
      brightness: Brightness.dark,
      primary: CepAppColors.primaryColor,
      onPrimary: CepAppColors.primaryColor,
      error: CepAppColors.errorColor,
      onError: CepAppColors.errorColor,
      onSurface: CepAppColors.darkBgColor,
    ),
    textTheme: light.textTheme.copyWith(
      bodyMedium: light.textTheme.bodyMedium!.copyWith(
        color: CepAppColors.whiteColor,
      ),
      titleMedium: light.textTheme.titleMedium!.copyWith(
        color: CepAppColors.whiteColor,
      ),
    ),
    inputDecorationTheme: light.inputDecorationTheme.copyWith(
      fillColor: CepAppColors.darkBgColor,
      hintStyle: TextStyle(color: Colors.grey.shade400),
    ),
  );
}

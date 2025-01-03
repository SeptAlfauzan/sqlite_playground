import 'package:flutter/material.dart';
import 'package:sql_playground/ui/colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      // Primary colors
      primary: AppColors.lime, // Blue
      onPrimary: AppColors.grey,
      primaryContainer: AppColors.lime, // Darker blue
      onPrimaryContainer: AppColors.grey,

      // Secondary colors
      secondary: Color(0xFF64B5F6), // Lighter blue
      onSecondary: Colors.black,
      secondaryContainer: Color(0xFF1976D2),
      onSecondaryContainer: AppColors.grey,

      // Tertiary colors
      tertiary: Color(0xFF81D4FA), // Even lighter blue
      onTertiary: Colors.black,
      tertiaryContainer: Color(0xFF0288D1),
      onTertiaryContainer: AppColors.grey,

      // Background colors
      surface: AppColors.black, // Slightly lighter than background
      onSurface: AppColors.grey,

      // Error colors
      error: AppColors.black, // Material dark error color
      onError: AppColors.pink,
      errorContainer: AppColors.darkerGrey,
      onErrorContainer: AppColors.red,
    ),

    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.lightGrey,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.lightGrey,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppColors.lightGrey,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.lightGrey,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.lightGrey,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.lightGrey,
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      centerTitle: true,
    ),
  );
}

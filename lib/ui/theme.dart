import 'package:flutter/material.dart';
import 'package:sql_playground/ui/colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      // Primary colors
      primary: Color(0xFF2196F3), // Blue
      onPrimary: AppColors.grey,
      primaryContainer: Color(0xFF0D47A1), // Darker blue
      onPrimaryContainer: AppColors.lime,

      // Secondary colors
      secondary: Color(0xFF64B5F6), // Lighter blue
      onSecondary: Colors.black,
      secondaryContainer: Color(0xFF1976D2),
      onSecondaryContainer: AppColors.lime,

      // Tertiary colors
      tertiary: Color(0xFF81D4FA), // Even lighter blue
      onTertiary: Colors.black,
      tertiaryContainer: Color(0xFF0288D1),
      onTertiaryContainer: AppColors.lime,

      // Background colors
      surface: AppColors.black, // Slightly lighter than background
      onSurface: AppColors.grey,

      // Error colors
      error: AppColors.red, // Material dark error color
      onError: Colors.black,
      errorContainer: Color(0xFFB00020),
      onErrorContainer: AppColors.lime,
    ),

    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.lime,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.lime,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.lime,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.lime,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.lime,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.lime,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.lime,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.lime,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppColors.lime,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.lime,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.lime,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.lime,
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

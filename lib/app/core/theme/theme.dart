import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme();

  static TextTheme textTheme(Color onSurface) {
    final baseTextStyle = TextStyle(
      color: onSurface,
      fontFamily: 'Roboto',
    );
    return TextTheme(
      displayLarge:   baseTextStyle.copyWith(fontSize: 96, fontWeight: FontWeight.bold),
      displayMedium:  baseTextStyle.copyWith(fontSize: 60, fontWeight: FontWeight.bold),
      displaySmall:   baseTextStyle.copyWith(fontSize: 48, fontWeight: FontWeight.bold),
      headlineLarge:  baseTextStyle.copyWith(fontSize: 44, fontWeight: FontWeight.bold),
      headlineMedium: baseTextStyle.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
      headlineSmall:  baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge:     baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      titleMedium:    baseTextStyle.copyWith(fontSize: 16),
      titleSmall:     baseTextStyle.copyWith(fontSize: 14),
      bodyLarge:      baseTextStyle.copyWith(fontSize: 16),
      bodyMedium:     baseTextStyle.copyWith(fontSize: 14),
      bodySmall:      baseTextStyle.copyWith(fontSize: 12),
      labelLarge:     baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium:    baseTextStyle.copyWith(fontSize: 12),
      labelSmall:     baseTextStyle.copyWith(fontSize: 10),
    );
  }

  static ThemeData light() {
    return ThemeData.light().copyWith(
      canvasColor: AppColors.backgroundLight,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: textTheme(AppColors.onSurfaceLight).titleLarge,
      ),
        dividerColor: AppColors.dividerColorLight,
        dialogBackgroundColor: AppColors.backgroundLight,
        dialogTheme: const DialogTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      textTheme: textTheme(AppColors.onSurfaceLight),
        colorScheme: const ColorScheme.light(
          surface: AppColors.backgroundLight,
          onSurface: AppColors.onSurfaceLight,
          surfaceVariant: AppColors.surfaceLightVariant,
          onSurfaceVariant: AppColors.onSurfaceLightVariant,
        )
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
        canvasColor: AppColors.backgroundDark,
        primaryColor: AppColors.primaryDark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryDark,
          titleTextStyle: textTheme(AppColors.onSurfaceLight).titleLarge,
        ),
        dialogTheme: const DialogTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        dividerColor: AppColors.dividerColorDark,
        dialogBackgroundColor: AppColors.backgroundDark,
        textTheme: textTheme(AppColors.onSurfaceDark),
        colorScheme: const ColorScheme.dark(
          surface: AppColors.backgroundDark,
          onSurface: AppColors.onSurfaceDark,
          surfaceVariant: AppColors.surfaceDarkVariant,
          onSurfaceVariant: AppColors.onSurfaceDarkVariant,
        )
    );
  }
}
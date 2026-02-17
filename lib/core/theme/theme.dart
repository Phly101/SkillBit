import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.surface,
      textTheme: _textTheme,
      colorScheme: ColorScheme(
        brightness: Brightness.light,

        // Brand Colors
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        tertiary: AppColors.tertiary,
        onTertiary: Colors.white,

        // UI Surfaces & Text
        surface: AppColors.surface,
        onSurface: AppColors.textMain,
        // Main Black headings
        onSurfaceVariant: AppColors.textSecondary,
        // Grey sub-text

        // Functional Colors
        error: AppColors.mainRed,
        onError: Colors.white,

        // Other colors can be mapped to custom slots
        outline: AppColors.mainGrey,
        shadow: Colors.black.withValues(alpha: 0.05),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          color: AppColors.secondary,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
        type: BottomNavigationBarType
            .fixed, // Keeps labels visible like in your design
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: AppColors.textMain,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColors.surface,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      color: AppColors.textMain,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      color: AppColors.textMain,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );
}

// theme helper for using theme colors :) =))
extension ThemeHelper on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

// Spacing helper for using space between widgets ;) =))
extension SpacingHelper on num {
  // Use: 10.heightBox
  SizedBox get heightBox => SizedBox(height: toDouble());

  // Use: 20.widthBox
  SizedBox get widthBox => SizedBox(width: toDouble());
}

// Padding helper for using pads between widgets ;) =))
extension WidgetPadding on Widget {
  Padding p10() => Padding(padding: const EdgeInsets.all(10), child: this);

  Padding pW(final double vertical) => Padding(
    padding: EdgeInsets.symmetric(vertical: vertical),
    child: this,
  );

  Padding pH(final double horizontal) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal),
    child: this,
  );
}

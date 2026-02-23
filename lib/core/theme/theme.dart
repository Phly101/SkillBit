import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

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
        onError: AppColors.correct,

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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
      fontWeight: FontWeight.w900,
      fontSize: 28,
      color: AppColors.textMain,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w900,
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

/// ===========================================================================
/// THEME HELPER
/// ===========================================================================
/// Provides quick access to the app's [TextTheme] and [ColorScheme].
/// This removes the need to write `Theme.of(context)` repeatedly.
extension ThemeHelper on BuildContext {
  /// Access text styles defined in your AppTheme.
  /// Example: `context.textTheme.displayLarge`
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Access the semantic colors defined in your AppTheme.
  /// Example: `context.colorScheme.primary`
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

/// ===========================================================================
/// SPACING HELPER
/// ===========================================================================
/// Adds spacing shortcuts to [num] (int and double).
/// This is used to create gaps between widgets in Columns or Rows
/// without manually creating a [SizedBox].
extension SpacingHelper on num {
  /// Creates a vertical gap.
  /// Example: `16.heightBox` is equivalent to `SizedBox(height: 16)`
  SizedBox get heightBox => SizedBox(height: toDouble());

  /// Creates a horizontal gap.
  /// Example: `10.widthBox` is equivalent to `SizedBox(width: 10)`
  SizedBox get widthBox => SizedBox(width: toDouble());
}

/// ===========================================================================
/// PADDING HELPER
/// ===========================================================================
/// Allows you to wrap any Widget in Padding by calling a method on it.
/// This prevents deep nesting and keeps the "child" visible at the start.
extension WidgetPadding on Widget {
  /// Wraps the widget with 10 pixels of padding on all sides.
  /// Example: `Text("Hello").p10()`
  Padding p10() => Padding(padding: const EdgeInsets.all(10), child: this);

  /// Wraps the widget with symmetric vertical padding.
  /// Example: `MyWidget().pV(20)`
  /// Note: renamed from pW to pV for "Vertical" clarity.
  Padding pV(final double vertical) => Padding(
    padding: EdgeInsets.symmetric(vertical: vertical),
    child: this,
  );

  /// Wraps the widget with symmetric horizontal padding.
  /// Example: `MyButton().pH(16)`
  Padding pH(final double horizontal) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal),
    child: this,
  );
}

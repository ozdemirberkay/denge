import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _deepTeal = Color(0xFF305F72);
const _paleBlue = Color(0xFFEAF9FE);

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: _deepTeal,
    primary: _deepTeal,
    onPrimary: _paleBlue,
    surface: _paleBlue,
    onSurface: _deepTeal,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme.primary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: colorScheme.primary,
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: colorScheme.primary.withValues(alpha: 0.12),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
            foregroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith(
              (states) => BorderSide(
                width: 1.5,
                color: states.contains(WidgetState.disabled)
                    ? colorScheme.primary.withValues(alpha: 0.3)
                    : colorScheme.primary,
              ),
            ),
          ),
    ),
  );
}

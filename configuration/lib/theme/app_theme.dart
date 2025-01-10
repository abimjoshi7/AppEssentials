import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 1,
        ),
        brightness: Brightness.light,
        colorScheme: _lightColorScheme,
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color(0xffE8F0FE),
          constraints: BoxConstraints(
            minHeight: 40,
          ),
        ),
        useMaterial3: true,
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: _darkColorScheme,
      );
}

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF005EB4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD6E3FF),
  onPrimaryContainer: Color(0xFF001B3C),
  secondary: Color(0xFF006B57),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF51FCD3),
  onSecondaryContainer: Color(0xFF002019),
  tertiary: Color(0xFF006879),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFAAEDFF),
  onTertiaryContainer: Color(0xFF001F26),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFDFBFF),
  onSurface: Color(0xff1A1D21),
  surfaceContainerHighest: Color(0xFFE0E2EC),
  onSurfaceVariant: Color(0xFF43474E),
  outline: Color(0xFF74777F),
  onInverseSurface: Color(0xFFECF0FF),
  inverseSurface: Color(0xff212529),
  inversePrimary: Color(0xff25A0E2),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF005EB4),
  outlineVariant: Color(0xFFC4C6CF),
  scrim: Color(0xFF000000),
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff25A0E2),
  onPrimary: Color(0xff212529),
  primaryContainer: Color(0xFF00468A),
  onPrimaryContainer: Color(0xFFD6E3FF),
  secondary: Color(0xFF1FDFB8),
  onSecondary: Color(0xFF00382C),
  secondaryContainer: Color(0xFF005141),
  onSecondaryContainer: Color(0xFF51FCD3),
  tertiary: Color(0xFF44D7F6),
  onTertiary: Color(0xFF003640),
  tertiaryContainer: Color(0xFF004E5C),
  onTertiaryContainer: Color(0xFFAAEDFF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xff1A1D21),
  onSurface: Color(0xFFD6E3FF),
  surfaceContainerHighest: Color(0xFF43474E),
  onSurfaceVariant: Color(0xFFC4C6CF),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xff1A1D21),
  inverseSurface: Color(0xFFD6E3FF),
  inversePrimary: Color(0xFF005EB4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xff25A0E2),
  outlineVariant: Color(0xFF43474E),
  scrim: Color(0xFF000000),
);

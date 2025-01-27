part of 'theme.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData.from(
        colorScheme: LightColorScheme(),
        useMaterial3: true,
      );

  static ThemeData get darkTheme => ThemeData.from(
        useMaterial3: true,
        colorScheme: DarkColorScheme(),
      );
}

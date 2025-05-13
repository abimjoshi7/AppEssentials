/// App Service
abstract class AppService {
  /// Getter for locale
  String get locale;

  /// Getter for theme
  bool get isDarkMode;

  /// Getter for initial user
  bool get isFirstUse;

  ///
  Future<void> setLocale({
    required String locale,
  });

  ///
  Future<void> setIsDarkMode({
    required bool darkMode,
  });

  ///
  Future<void> setIsFirstUse({
    required bool isFirstUse,
  });
}

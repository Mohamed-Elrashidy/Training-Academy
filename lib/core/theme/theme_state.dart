import 'dart:ui';

class ThemeState {
  bool isDarkMode;
  Locale locale;
  ThemeState({required this.isDarkMode, required this.locale});
  copyWith({bool? isDarkMode, Locale? locale}) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      locale: locale ?? this.locale,
    );
  }
}

class ThemeInitial extends ThemeState {
  ThemeInitial({required super.isDarkMode, required super.locale});
}

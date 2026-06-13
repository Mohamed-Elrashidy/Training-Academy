import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/core/configurations/app_keys.dart';
import 'package:training_acedamy/core/helpers/storage/shared_prefrence_helper.dart';
import 'package:training_acedamy/core/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(ThemeInitial(isDarkMode: false, locale: const Locale('en'))) {
    loadTheme();
  }
  static ThemeCubit get _instance => getIt<ThemeCubit>();
  static bool get isDarkMode {
    return _instance.state.isDarkMode;
  }

  static bool get isEnglish {
    return _instance.state.locale.languageCode == 'en';
  }

  Future<void> loadTheme() async {
    bool isDarkMode = false;
    Locale locale = const Locale('en');
    await SharedPrefrenceHelper.init();
    isDarkMode =
        SharedPrefrenceHelper.instance.getValue<bool>(AppKeys.darkModeKey) ??
        false;
    String languageCode =
        SharedPrefrenceHelper.instance.getValue<String>(AppKeys.languageKey) ??
        'en';
    locale = Locale(languageCode);
    emit(ThemeInitial(isDarkMode: isDarkMode, locale: locale));
  }

  static void toggleDarkMode(bool value) {
    SharedPrefrenceHelper.instance.setValue<bool>(AppKeys.darkModeKey, value);
    _instance.emit(
      ThemeInitial(isDarkMode: value, locale: _instance.state.locale),
    );
  }

  static void toggleLanguage(bool value) {
    String languageCode = value ? 'en' : 'ar';
    SharedPrefrenceHelper.instance.setValue<String>(
      AppKeys.languageKey,
      languageCode,
    );
    _instance.emit(
      ThemeInitial(
        isDarkMode: _instance.state.isDarkMode,
        locale: Locale(languageCode),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/configurations/app_keys.dart';
import 'package:training_acedamy/core/helpers/storage/shared_prefrence_helper.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial.fromPreferences());

  bool get isDarkMode => ThemeCubit.isDarkMode;
  bool get isEnglish => ThemeCubit.isEnglish;
  bool get notificationsEnabled => state.notificationsEnabled;
  bool get biometricsEnabled => state.biometricsEnabled;

  void toggleDarkMode(bool value) {
    ThemeCubit.toggleDarkMode(value);
  }

  void toggleLanguage(bool value) {
    ThemeCubit.toggleLanguage(value);
  }

  void toggleNotifications(bool value) {
    SharedPrefrenceHelper.instance.setValue<bool>(
      AppKeys.notificationsKey,
      value,
    );
    emit(state.copyWith(notificationsEnabled: value));
  }

  void toggleBiometrics(bool value) {
    SharedPrefrenceHelper.instance.setValue<bool>(AppKeys.biometricsKey, value);
    emit(state.copyWith(biometricsEnabled: value));
  }
}

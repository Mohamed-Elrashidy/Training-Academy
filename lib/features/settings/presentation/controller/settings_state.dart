part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {
  final bool notificationsEnabled;
  final bool biometricsEnabled;

  const SettingsState({
    required this.notificationsEnabled,
    required this.biometricsEnabled,
  });

  SettingsState copyWith({
    bool? notificationsEnabled,
    bool? biometricsEnabled,
  }) {
    return SettingsInitial(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
    );
  }
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial({
    required super.notificationsEnabled,
    required super.biometricsEnabled,
  });

  factory SettingsInitial.fromPreferences() {
    return SettingsInitial(
      notificationsEnabled: _readBool(AppKeys.notificationsKey),
      biometricsEnabled: _readBool(AppKeys.biometricsKey),
    );
  }

  static bool _readBool(String key) {
    try {
      return SharedPrefrenceHelper.instance.getValue<bool>(key) ?? false;
    } catch (_) {
      return false;
    }
  }
}

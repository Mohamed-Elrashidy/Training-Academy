import 'package:crypto/crypto.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';

typedef PackageInfoLoader = Future<PackageInfo> Function();

class CrashlyticsService {
  CrashlyticsService({
    FirebaseCrashlytics? crashlytics,
    PackageInfoLoader? packageInfoLoader,
  }) : _providedCrashlytics = crashlytics,
       _packageInfoLoader = packageInfoLoader ?? PackageInfo.fromPlatform;

  static final CrashlyticsService instance = CrashlyticsService();

  final FirebaseCrashlytics? _providedCrashlytics;
  final PackageInfoLoader _packageInfoLoader;
  FirebaseCrashlytics? _resolvedCrashlytics;

  bool get isSupported => !kIsWeb;

  FirebaseCrashlytics? get _crashlytics {
    if (!isSupported) {
      return null;
    }

    if (_providedCrashlytics != null) {
      return _providedCrashlytics;
    }

    _resolvedCrashlytics ??= _resolveCrashlytics();
    return _resolvedCrashlytics;
  }

  Future<void> initialize({required bool enableCollection}) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.setCrashlyticsCollectionEnabled(enableCollection);
    await _setStaticContext(crashlytics);
  }

  Future<void> log(String message) async {
    print("log called with message: $message");
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.log(message);
  }

  Future<void> setCustomKey(String key, Object value) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.setCustomKey(key, value);
  }

  Future<void> setScreenContext({
    String? route,
    String? feature,
    String? module,
  }) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    if (route != null && route.isNotEmpty) {
      await crashlytics.setCustomKey('route', route);
    }
    if (feature != null && feature.isNotEmpty) {
      await crashlytics.setCustomKey('feature', feature);
    }
    if (module != null && module.isNotEmpty) {
      await crashlytics.setCustomKey('module', module);
    }
  }

  Future<void> setUserContext({
    required String userId,
    String? accountType,
    String? role,
  }) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.setUserIdentifier(hashIdentifier(userId));

    if (accountType != null && accountType.isNotEmpty) {
      await crashlytics.setCustomKey('account_type', accountType);
    }

    if (role != null && role.isNotEmpty) {
      await crashlytics.setCustomKey('user_role', role);
    }
  }

  Future<void> clearUserContext() async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.setUserIdentifier('');
    await crashlytics.setCustomKey('account_type', 'anonymous');
    await crashlytics.setCustomKey('user_role', 'unknown');
  }

  Future<void> recordNonFatal(
    Object error,
    StackTrace stackTrace, {
    String? reason,
    Iterable<Object> information = const [],
    Map<String, Object?> extraKeys = const {},
  }) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    for (final entry in extraKeys.entries) {
      final value = entry.value;
      if (value != null) {
        await crashlytics.setCustomKey(entry.key, value);
      }
    }

    await crashlytics.recordError(
      error,
      stackTrace,
      reason: reason,
      information: information,
      fatal: false,
    );
  }

  Future<void> recordFatalError(
    Object error,
    StackTrace stackTrace, {
    String? reason,
  }) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.recordError(
      error,
      stackTrace,
      reason: reason,
      fatal: true,
    );
  }

  Future<void> recordFlutterFatalError(FlutterErrorDetails details) async {
    final crashlytics = _crashlytics;
    if (crashlytics == null) {
      return;
    }

    await crashlytics.recordFlutterFatalError(details);
  }

  static String hashIdentifier(String rawIdentifier) {
    final normalizedIdentifier = rawIdentifier.trim().toLowerCase();
    return sha256.convert(normalizedIdentifier.codeUnits).toString();
  }

  static String? deriveFeatureFromRoute(String? route) {
    if (route == null || route.isEmpty) {
      return null;
    }

    final segments = route.split('/').where((segment) => segment.isNotEmpty);
    if (segments.isEmpty) {
      return null;
    }

    return segments.first;
  }

  static String? deriveModuleFromRoute(String? route) {
    if (route == null || route.isEmpty) {
      return null;
    }

    final segments = route.split('/').where((segment) => segment.isNotEmpty);
    if (segments.isEmpty) {
      return null;
    }

    return segments.last;
  }

  Future<void> _setStaticContext(FirebaseCrashlytics crashlytics) async {
    await crashlytics.setCustomKey(
      'backend_provider',
      AppConfigurations.backendService.name.toLowerCase(),
    );
    await crashlytics.setCustomKey(
      'build_mode',
      kDebugMode ? 'debug' : 'release',
    );
    await crashlytics.setCustomKey('account_type', 'anonymous');
    await crashlytics.setCustomKey('user_role', 'unknown');

    final packageInfo = await _packageInfoLoader();
    await crashlytics.setCustomKey('app_version', packageInfo.version);
    await crashlytics.setCustomKey('build_number', packageInfo.buildNumber);
    await crashlytics.setCustomKey('package_name', packageInfo.packageName);
  }

  FirebaseCrashlytics? _resolveCrashlytics() {
    try {
      return FirebaseCrashlytics.instance;
    } catch (_) {
      return null;
    }
  }
}

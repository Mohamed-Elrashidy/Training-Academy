import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_service.dart';
import 'package:training_acedamy/firebase_options.dart';

class CrashlyticsInitializer {
  CrashlyticsInitializer({CrashlyticsService? crashlyticsService})
    : _crashlyticsService = crashlyticsService ?? CrashlyticsService.instance;

  final CrashlyticsService _crashlyticsService;

  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await _crashlyticsService.initialize(enableCollection: true);
    _registerGlobalHandlers();
  }

  void _registerGlobalHandlers() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      _crashlyticsService.recordFlutterFatalError(details);
    };

    PlatformDispatcher.instance.onError =
        (Object error, StackTrace stackTrace) {
          _crashlyticsService.recordFatalError(
            error,
            stackTrace,
            reason: 'Uncaught platform error',
          );
          return true;
        };

    if (_crashlyticsService.isSupported) {
      Isolate.current.addErrorListener(
        RawReceivePort((dynamic pair) async {
          final List<dynamic> errorAndStackTrace = pair as List<dynamic>;
          final isolateStackTrace = errorAndStackTrace.last is StackTrace
              ? errorAndStackTrace.last as StackTrace
              : StackTrace.fromString(errorAndStackTrace.last.toString());
          await _crashlyticsService.recordFatalError(
            errorAndStackTrace.first,
            isolateStackTrace,
            reason: 'Uncaught isolate error',
          );
        }).sendPort,
      );
    }
  }
}

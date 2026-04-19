import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:training_acedamy/training_academy_app.dart';

Future<void> main() async {
  await SentryFlutter.init((options) {
    options.dsn =
        'https://c0940d9846d3edd43f62b1abf696c65b@o4510714534887424.ingest.de.sentry.io/4510714539081808';
    options.sendDefaultPii = true;
    options.enableLogs = true;
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
    // The sampling rate for profiling is relative to tracesSampleRate
    // Setting to 1.0 will profile 100% of sampled transactions:
    options.profilesSampleRate = 1.0;
    // Configure Session Replay
    options.replay.sessionSampleRate = 0.1;
    options.replay.onErrorSampleRate = 1.0;
  }, appRunner: () => runApp(SentryWidget(child: TrainingAcademyApp())));
  // TODO: Remove this line after sending the first sample event to sentry.
}

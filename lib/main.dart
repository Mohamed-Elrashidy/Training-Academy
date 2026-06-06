import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_initializer.dart';
import 'package:training_acedamy/training_academy_app.dart';

import 'core/configurations/app_configurations.dart';

Future<void> main() async {
  await CrashlyticsInitializer().initialize();
  print("base url: ${AppConfigurations.supabaseUrl}");
  runApp(TrainingAcademyApp());
}

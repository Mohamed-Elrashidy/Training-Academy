import 'package:flutter/material.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_initializer.dart';
import 'package:training_acedamy/training_academy_app.dart';

import 'core/configurations/app_configurations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CrashlyticsInitializer().initialize();
  await AppCoordinator.init();
  print("base url: ${AppConfigurations.supabaseUrl}");
  runApp(TrainingAcademyApp());
}

import 'package:training_acedamy/l10n/app_localizations.dart';
import 'package:training_acedamy/training_academy_app.dart';

mixin LocalizationExtension on AppLocalizations {
  AppLocalizations get current =>
      AppLocalizations.of(appMainNavigatorKey.currentContext!)!;
}

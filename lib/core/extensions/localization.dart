import 'package:training_acedamy/l10n/app_localizations.dart';
import 'package:training_acedamy/core/configurations/app_navigator_key.dart';

mixin LocalizationExtension on AppLocalizations {
  AppLocalizations get current =>
      AppLocalizations.of(appMainNavigatorKey.currentContext!)!;
}

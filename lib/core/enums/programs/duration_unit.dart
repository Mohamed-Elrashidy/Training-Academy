import 'package:flutter/cupertino.dart';

import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

enum DurationUnit {
  minutes,
  hours,
  months,
  years;

  String get displayName {
    final BuildContext context = appMainNavigatorKey.currentContext!;
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case DurationUnit.minutes:
        return l10n.minutes;
      case DurationUnit.hours:
        return l10n.hours;
      case DurationUnit.months:
        return l10n.months;
      case DurationUnit.years:
        return l10n.years;
    }
  }

  String get databaseName {
    switch (this) {
      case DurationUnit.minutes:
        return 'minutes';
      case DurationUnit.hours:
        return 'hours';
      case DurationUnit.months:
        return 'months';
      case DurationUnit.years:
        return 'years';
    }
  }
}

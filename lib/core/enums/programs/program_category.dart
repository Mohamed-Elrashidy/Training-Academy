import 'package:flutter/cupertino.dart';
import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

enum ProgramCategory {
  football,
  basketball,
  volleyball,
  handball,
  swimming,
  tennis,
  athletics,
  martialArts,
  fitness,
  crossFit;

  String get disPlayName {
    final BuildContext context = appMainNavigatorKey.currentContext!;
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case ProgramCategory.football:
        return l10n.football;
      case ProgramCategory.basketball:
        return l10n.basketball;
      case ProgramCategory.volleyball:
        return l10n.volleyball;
      case ProgramCategory.handball:
        return l10n.handball;
      case ProgramCategory.swimming:
        return l10n.swimming;
      case ProgramCategory.tennis:
        return l10n.tennis;
      case ProgramCategory.athletics:
        return l10n.athletics;
      case ProgramCategory.martialArts:
        return l10n.martialArts;
      case ProgramCategory.fitness:
        return l10n.fitness;
      case ProgramCategory.crossFit:
        return l10n.crossFit;
    }
  }

  String get databaseName {
    switch (this) {
      case ProgramCategory.football:
        return 'football';
      case ProgramCategory.basketball:
        return 'basketball';
      case ProgramCategory.volleyball:
        return 'volleyball';
      case ProgramCategory.handball:
        return 'handball';
      case ProgramCategory.swimming:
        return 'swimming';
      case ProgramCategory.tennis:
        return 'tennis';
      case ProgramCategory.athletics:
        return 'athletics';
      case ProgramCategory.martialArts:
        return 'martial_arts';
      case ProgramCategory.fitness:
        return 'fitness';
      case ProgramCategory.crossFit:
        return 'crossfit';
    }
  }
}

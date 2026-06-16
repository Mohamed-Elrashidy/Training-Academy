import 'package:flutter/cupertino.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../configurations/app_navigator_key.dart';

enum ProgramLevel {
  beginner,
  intermediate,
  advanced,
  elite;

  String get disPlayName {
    BuildContext context = appMainNavigatorKey.currentContext!;
    switch (this) {
      case ProgramLevel.beginner:
        return AppLocalizations.of(context)!.beginner;
      case ProgramLevel.intermediate:
        return AppLocalizations.of(context)!.intermediate;
      case ProgramLevel.advanced:
        return AppLocalizations.of(context)!.advanced;
      case ProgramLevel.elite:
        return AppLocalizations.of(context)!.elite;
    }
  }

  String get databaseName {
    switch (this) {
      case ProgramLevel.beginner:
        return 'beginner';
      case ProgramLevel.intermediate:
        return 'intermediate';
      case ProgramLevel.advanced:
        return 'advanced';
      case ProgramLevel.elite:
        return 'elite';
    }
  }
}

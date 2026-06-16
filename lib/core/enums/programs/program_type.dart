import 'package:flutter/cupertino.dart';
import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

enum ProgramType {
  general,
  customized;

  String get disPlayName {
    BuildContext context = appMainNavigatorKey.currentContext!;
    switch (this) {
      case ProgramType.general:
        return AppLocalizations.of(context)!.general;
      case ProgramType.customized:
        return AppLocalizations.of(context)!.customized;
    }
  }

  String get databaseName {
    switch (this) {
      case ProgramType.general:
        return 'general';
      case ProgramType.customized:
        return 'customized';
    }
  }
}

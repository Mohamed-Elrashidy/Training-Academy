import 'package:flutter/cupertino.dart';
import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

enum ProgramStatus {
  all,
  active,
  inactive,
  removed;

  String get disPlayName {
    BuildContext context = appMainNavigatorKey.currentContext!;
    switch (this) {
      case ProgramStatus.all:
        return AppLocalizations.of(context)!.all;
      case ProgramStatus.active:
        return AppLocalizations.of(context)!.active;
      case ProgramStatus.inactive:
        return AppLocalizations.of(context)!.inactive;
      case ProgramStatus.removed:
        return AppLocalizations.of(context)!.removed;
    }
  }

  String get databaseName {
    switch (this) {
      case ProgramStatus.all:
        return "all";
      case ProgramStatus.active:
        return 'active';
      case ProgramStatus.inactive:
        return 'inactive';
      case ProgramStatus.removed:
        return 'removed';
    }
  }
}

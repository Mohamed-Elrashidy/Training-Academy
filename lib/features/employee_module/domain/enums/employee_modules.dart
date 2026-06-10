import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../training_academy_app.dart';

enum EmployeeModules {
  home,
  messages,
  programs,
  programsManagement,
  forms,
  news,
  profile,
  settings;

  String get title {
    BuildContext context = appMainNavigatorKey.currentContext!;
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case EmployeeModules.home:
        return l10n.home;
      case EmployeeModules.messages:
        return l10n.messages;
      case EmployeeModules.programs:
        return l10n.programs;
      case EmployeeModules.programsManagement:
        return l10n.programsManagement;
      case EmployeeModules.forms:
        return l10n.forms;
      case EmployeeModules.news:
        return l10n.news;
      case EmployeeModules.profile:
        return l10n.profile;
      case EmployeeModules.settings:
        return l10n.settings;
    }
  }

  IconData get icon {
    switch (this) {
      case EmployeeModules.home:
        return Icons.home_outlined;
      case EmployeeModules.messages:
        return Icons.message_outlined;
      case EmployeeModules.programs:
        return Icons.school_outlined;
      case EmployeeModules.programsManagement:
        return Icons.manage_accounts_outlined;
      case EmployeeModules.forms:
        return Icons.description_outlined;
      case EmployeeModules.news:
        return Icons.newspaper_outlined;
      case EmployeeModules.profile:
        return Icons.person_outline;
      case EmployeeModules.settings:
        return Icons.settings_outlined;
    }
  }
}

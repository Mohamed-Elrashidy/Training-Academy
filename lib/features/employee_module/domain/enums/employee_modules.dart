import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/base_classes/modules/base_modules_enum.dart';
import 'package:training_acedamy/features/settings/presentation/controller/settings_cubit.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../program_management/presentation/ui/pages/program_managements_layout.dart';
import '../../../settings/presentation/ui/pages/settings_page_layout.dart';

enum EmployeeModules implements BaseModulesEnum {
  home,
  messages,
  programs,
  programsManagement,
  forms,
  news,
  profile,
  settings;

  @override
  Widget get widget {
    switch (this) {
      case EmployeeModules.home:
        return _EmployeeModulePlaceholder(title: 'Employee Home');
      case EmployeeModules.messages:
        return _EmployeeModulePlaceholder(title: 'Employee Messages');
      case EmployeeModules.programs:
        return _EmployeeModulePlaceholder(title: 'Employee Programs');
      case EmployeeModules.programsManagement:
        return const ProgramManagementsLayout();
      case EmployeeModules.forms:
        return _EmployeeModulePlaceholder(title: 'Employee Forms');
      case EmployeeModules.news:
        return _EmployeeModulePlaceholder(title: 'Employee News');
      case EmployeeModules.profile:
        return _EmployeeModulePlaceholder(title: 'Employee Profile');
      case EmployeeModules.settings:
        return BlocProvider(
          create: (context) => SettingsCubit(),
          child: SettingsPageLayout(),
        );
    }
  }

  @override
  String title(BuildContext context) {
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

  @override
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

class _EmployeeModulePlaceholder extends StatelessWidget {
  const _EmployeeModulePlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

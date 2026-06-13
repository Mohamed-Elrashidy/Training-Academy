import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/base_classes/modules/base_modules_enum.dart';
import 'package:training_acedamy/features/settings/presentation/controller/settings_cubit.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../settings/presentation/ui/pages/settings_page_layout.dart';

enum ClientModules implements BaseModulesEnum {
  home,
  messages,
  programs,
  forms,
  news,
  profile,
  settings;

  @override
  Widget get widget {
    switch (this) {
      case ClientModules.home:
        return const Text('Home');
      case ClientModules.messages:
        return const Text('Messages');
      case ClientModules.programs:
        return const Text('Programs');
      case ClientModules.forms:
        return const Text('Forms');
      case ClientModules.news:
        return const Text('News');
      case ClientModules.profile:
        return const Text('Profile');
      case ClientModules.settings:
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
      case ClientModules.home:
        return l10n.home;
      case ClientModules.messages:
        return l10n.messages;
      case ClientModules.programs:
        return l10n.programs;
      case ClientModules.forms:
        return l10n.forms;
      case ClientModules.news:
        return l10n.news;
      case ClientModules.profile:
        return l10n.profile;
      case ClientModules.settings:
        return l10n.settings;
    }
  }

  @override
  IconData get icon {
    switch (this) {
      case ClientModules.home:
        return Icons.home_rounded;
      case ClientModules.messages:
        return Icons.message_rounded;
      case ClientModules.programs:
        return Icons.fitness_center_rounded;
      case ClientModules.forms:
        return Icons.description_rounded;
      case ClientModules.news:
        return Icons.article_rounded;
      case ClientModules.profile:
        return Icons.person;
      case ClientModules.settings:
        return Icons.settings_rounded;
    }
  }
}

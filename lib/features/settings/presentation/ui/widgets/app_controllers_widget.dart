import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/widgets/switches/custom_switch.dart';
import 'package:training_acedamy/features/settings/presentation/controller/settings_cubit.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/widgets/dividers/horizontal_divider.dart';

class AppControllersWidget extends StatelessWidget {
  const AppControllersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final cubit = context.read<SettingsCubit>();
        return Container(
          padding: EdgeInsets.all(16.sp),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppCustomColor.mainContainerColor.color,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Column(
            spacing: 8.sp,
            children: [
              CustomSwitch(
                title: AppLocalizations.of(context)!.darkMode,
                value: cubit.isDarkMode,
                onChanged: cubit.toggleDarkMode,
              ),
              HorizontalDivider(),
              CustomSwitch(
                title: AppLocalizations.of(context)!.language,
                value: cubit.isEnglish,
                onChanged: cubit.toggleLanguage,
              ),
              HorizontalDivider(),
              CustomSwitch(
                title: AppLocalizations.of(context)!.notifications,
                value: cubit.notificationsEnabled,
                onChanged: cubit.toggleNotifications,
              ),
              HorizontalDivider(),
              CustomSwitch(
                title: AppLocalizations.of(context)!.biometrics,
                value: cubit.biometricsEnabled,
                onChanged: cubit.toggleBiometrics,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/app_bars/custom_app_bar.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import 'settings_page_desktop.dart';
import 'settings_page_mobile.dart';

class SettingsPageLayout extends StatelessWidget {
  const SettingsPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          VerticalSpacer(height: 8),
          CustomAppBar(title: AppLocalizations.of(context)!.settings),
          VerticalSpacer(height: 16),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return const SettingsPageMobile();
                } else {
                  return const SettingsPageDesktop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

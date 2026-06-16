import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/app_bars/custom_app_bar.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';
import 'package:training_acedamy/features/program_management/presentation/ui/pages/program_management_overview_page.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class ProgramManagementsLayout extends StatelessWidget {
  const ProgramManagementsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          VerticalSpacer(height: 8),
          CustomAppBar(title: AppLocalizations.of(context)!.programsManagement),
          VerticalSpacer(height: 16),
          Expanded(child: ProgramManagementOverviewPage()),
        ],
      ),
    );
  }
}

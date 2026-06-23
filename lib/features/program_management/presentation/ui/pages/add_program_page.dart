import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/widgets/app_bars/custom_app_bar.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';

import '../../../../../l10n/app_localizations.dart';
import '../widgets/program_basic_info.dart';
import '../widgets/program_objectives.dart';
import '../widgets/program_prerequisites.dart';

class AddProgramPage extends StatefulWidget {
  const AddProgramPage({super.key});

  @override
  State<AddProgramPage> createState() => _AddProgramPageState();
}

class _AddProgramPageState extends State<AddProgramPage> {
  late ProgramEntity entity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entity = ProgramEntity.newEmptyInstance();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacer(height: 8),
          CustomAppBar(title: AppLocalizations.of(context)!.addProgram),
          const VerticalSpacer(height: 32),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 24.sp,
                children: [
                  ProgramBasicInfo(entity: entity),
                  ProgramPrerequisites(entity: entity),
                  ProgramObjectives(entity: entity),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

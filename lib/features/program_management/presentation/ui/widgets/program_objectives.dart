import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/fields/removable_localize_text_builder.dart';
import 'package:training_acedamy/core/widgets/layout_builders/expand_wrapper.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class ProgramObjectives extends StatefulWidget {
  const ProgramObjectives({
    super.key,
    required this.entity,
    this.isReadOnly = false,
    this.onChanged,
  });

  final ProgramEntity entity;
  final bool isReadOnly;
  final Function()? onChanged;

  @override
  State<ProgramObjectives> createState() => _ProgramObjectivesState();
}

class _ProgramObjectivesState extends State<ProgramObjectives> {
  @override
  void initState() {
    super.initState();
    widget.entity.arabicObjectives ??= [];
    widget.entity.englishObjectives ??= [];
  }

  @override
  Widget build(BuildContext context) {
    return ExpandWrapper(
      title: AppLocalizations.of(context)!.objectives,
      child: RemovableLocalizeTextBuilder(
        arabicTextFields: widget.entity.arabicObjectives!,
        englishTextFields: widget.entity.englishObjectives!,
        arabicValidator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.all;
          }
          return null;
        },
        englishValidator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.all;
          }
          return null;
        },
        arabicHint: "الأهداف",
        englishHint: "Objectives",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/fields/removable_localize_text_builder.dart';
import 'package:training_acedamy/core/widgets/layout_builders/expand_wrapper.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class ProgramLearningOutcomes extends StatefulWidget {
  const ProgramLearningOutcomes({
    super.key,
    required this.entity,
    this.isReadOnly = false,
    this.onChanged,
  });

  final ProgramEntity entity;
  final bool isReadOnly;
  final Function()? onChanged;

  @override
  State<ProgramLearningOutcomes> createState() =>
      _ProgramLearningOutcomesState();
}

class _ProgramLearningOutcomesState extends State<ProgramLearningOutcomes> {
  @override
  void initState() {
    super.initState();
    widget.entity.arabicLearningOutcomes ??= [];
    widget.entity.englishLearningOutcomes ??= [];
  }

  @override
  Widget build(BuildContext context) {
    return ExpandWrapper(
      title: AppLocalizations.of(context)!.learningOutcomes,
      child: RemovableLocalizeTextBuilder(
        arabicTextFields: widget.entity.arabicLearningOutcomes!,
        englishTextFields: widget.entity.englishLearningOutcomes!,
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
        arabicHint: "مخرجات التعلم",
        englishHint: "Learning Outcomes",
      ),
    );
  }
}

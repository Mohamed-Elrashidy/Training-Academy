import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/fields/removable_localize_text_builder.dart';
import 'package:training_acedamy/core/widgets/layout_builders/expand_wrapper.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class ProgramPrerequisites extends StatefulWidget {
  const ProgramPrerequisites({
    super.key,
    required this.entity,
    this.isReadOnly = false,
    this.onChanged,
  });
  final ProgramEntity entity;
  final bool isReadOnly;
  final Function()? onChanged;

  @override
  State<ProgramPrerequisites> createState() => _ProgramPrerequisitesState();
}

class _ProgramPrerequisitesState extends State<ProgramPrerequisites> {
  @override
  void initState() {
    super.initState();
    if (widget.entity.arabicPrerequisites == null) {
      widget.entity.arabicPrerequisites = [];
    }
    if (widget.entity.englishPrerequisites == null) {
      widget.entity.englishPrerequisites = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpandWrapper(
      title: AppLocalizations.of(context)!.prerequisites,
      child: RemovableLocalizeTextBuilder(
        arabicTextFields: widget.entity.arabicPrerequisites!,
        englishTextFields: widget.entity.englishPrerequisites!,
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
        arabicHint: "المتطلبات",
        englishHint: "Prerequisites",
      ),
    );
  }
}

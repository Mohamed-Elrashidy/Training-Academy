import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/fields/removable_localize_text_builder.dart';
import 'package:training_acedamy/core/widgets/layout_builders/expand_wrapper.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class ProgramNotes extends StatefulWidget {
  const ProgramNotes({
    super.key,
    required this.entity,
    this.isReadOnly = false,
    this.onChanged,
  });

  final ProgramEntity entity;
  final bool isReadOnly;
  final Function()? onChanged;

  @override
  State<ProgramNotes> createState() => _ProgramNotesState();
}

class _ProgramNotesState extends State<ProgramNotes> {
  @override
  void initState() {
    super.initState();
    widget.entity.arabicNotes ??= [];
    widget.entity.englishNotes ??= [];
  }

  @override
  Widget build(BuildContext context) {
    return ExpandWrapper(
      title: AppLocalizations.of(context)!.notes,
      child: RemovableLocalizeTextBuilder(
        arabicTextFields: widget.entity.arabicNotes!,
        englishTextFields: widget.entity.englishNotes!,
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
        arabicHint: "ملاحظات",
        englishHint: "Notes",
      ),
    );
  }
}

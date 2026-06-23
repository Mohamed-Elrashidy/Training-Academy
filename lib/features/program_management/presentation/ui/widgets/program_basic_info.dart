import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/fields/localize_text_fields.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/widgets/layout_builders/expand_wrapper.dart';
import '../../../../../core/widgets/media/single_image_picker.dart';
import '../../../../../l10n/app_localizations.dart';

class ProgramBasicInfo extends StatefulWidget {
  const ProgramBasicInfo({
    super.key,
    required this.entity,
    this.isReadOnly = false,
    this.onChanged,
  });
  final ProgramEntity entity;
  final bool isReadOnly;
  final Function()? onChanged;

  @override
  State<ProgramBasicInfo> createState() => _ProgramBasicInfoState();
}

class _ProgramBasicInfoState extends State<ProgramBasicInfo> {
  late TextEditingController arabicTitleController;
  late TextEditingController englishTitleController;
  late TextEditingController arabicDescriptionController;
  late TextEditingController englishDescriptionController;
  @override
  void initState() {
    super.initState();
    arabicTitleController = TextEditingController(
      text: widget.entity.arabicProgramTitle,
    );
    englishTitleController = TextEditingController(
      text: widget.entity.englishProgramTitle,
    );
    arabicDescriptionController = TextEditingController(
      text: widget.entity.arabicDescription,
    );
    englishDescriptionController = TextEditingController(
      text: widget.entity.englishDescription,
    );
  }

  @override
  void dispose() {
    arabicTitleController.dispose();
    englishTitleController.dispose();
    arabicDescriptionController.dispose();
    englishDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandWrapper(
      title: AppLocalizations.of(context)!.basicInfo,
      child: Column(
        spacing: 16.sp,
        children: [
          LocalizeTextFields(
            arabicTextController: arabicTitleController,
            englishTextController: englishTitleController,
            arabicHint: "العنوان",
            englishHint: "Title",
            arabicTitle: "العنوان",
            englishTitle: "Title",
          ),
          LocalizeTextFields(
            isDescription: true,
            arabicTextController: arabicDescriptionController,
            englishTextController: englishDescriptionController,
            arabicHint: "الوصف",
            englishHint: "Description",
            arabicTitle: "الوصف",
            englishTitle: "Description",
          ),
          SingleImagePicker(
            title: AppLocalizations.of(context)!.thumbnailImage,
            initialImage: widget.entity.thumbnailUrl,
            isReadOnly: widget.isReadOnly,
            onImageChanged: (String? image) {
              widget.entity.thumbnailUrl = image;
              widget.onChanged?.call();
            },
          ),
          SingleImagePicker(
            title: AppLocalizations.of(context)!.coverImage,
            initialImage: widget.entity.coverImageUrl,
            isReadOnly: widget.isReadOnly,
            onImageChanged: (String? image) {
              widget.entity.coverImageUrl = image;
              widget.onChanged?.call();
            },
          ),
        ],
      ),
    );
  }
}

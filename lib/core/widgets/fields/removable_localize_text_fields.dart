import 'dart:core';

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';
import 'package:training_acedamy/core/widgets/buttons/minus_button.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field.dart';

import '../../extensions/context_extensions.dart';
import '../layout_builders/custom_grid_view_builder.dart';

class RemovableLocalizeTextFields extends StatefulWidget {
  const RemovableLocalizeTextFields({
    required this.arabicValidator,
    required this.englishValidator,
    required this.initialArabicString,
    required this.initialEnglishString,
    required this.onArabicStringChanged,
    required this.onEnglishStringChanged,
    required this.arabicHint,
    required this.englishHint,
    required this.onRemove,
    super.key,
  });
  final String initialArabicString;
  final String initialEnglishString;
  final Function(String?) onArabicStringChanged;
  final Function(String?) onEnglishStringChanged;
  final String? Function(String?) arabicValidator;
  final String? Function(String?) englishValidator;
  final String arabicHint;
  final String englishHint;
  final Function() onRemove;

  @override
  State<RemovableLocalizeTextFields> createState() =>
      _RemovableLocalizeTextFieldsState();
}

class _RemovableLocalizeTextFieldsState
    extends State<RemovableLocalizeTextFields> {
  late TextEditingController arabicTextController;
  late TextEditingController englishTextController;

  @override
  void initState() {
    super.initState();
    arabicTextController = TextEditingController();
    englishTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    arabicTextController.dispose();
    englishTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> fields = ThemeCubit.isEnglish
        ? buildFields()
        : buildFields().reversed.toList();
    return Row(
      spacing: context.horizontalComponentItemSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomGridViewBuilder(
            numberOfRows: context.responsive.isMobile ? 2 : 1,
            widgets: fields,
          ),
        ),
        MinusButton(
          onTap: () {
            widget.onRemove();
          },
        ),
      ],
    );
  }

  List<Widget> buildFields() {
    return [
      Directionality(
        textDirection: TextDirection.ltr,
        child: CustomTextField(
          controller: englishTextController,
          validator: widget.englishValidator,
          hintText: widget.englishHint,
        ),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: CustomTextField(
          controller: arabicTextController,
          validator: widget.arabicValidator,
          hintText: widget.arabicHint,
        ),
      ),
    ];
  }

  /// when row
  /// english
  /// english text field, arabic text field, minus button
  /// arabic arabic text field english text field, minus button
  /// when column
  /// english
  /// english text fild, minus button first row
  /// arabic
  /// arabic text
}

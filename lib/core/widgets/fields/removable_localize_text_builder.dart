import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/widgets/buttons/add_more_button.dart';
import 'package:training_acedamy/core/widgets/fields/removable_localize_text_fields.dart';

class RemovableLocalizeTextBuilder extends StatefulWidget {
  RemovableLocalizeTextBuilder({
    required this.arabicTextFields,
    required this.englishTextFields,
    required this.arabicValidator,
    required this.englishValidator,
    required this.arabicHint,
    required this.englishHint,
    super.key,
  });
  List<String> arabicTextFields;
  List<String> englishTextFields;
  final String? Function(String?) arabicValidator;
  final String? Function(String?) englishValidator;
  final String arabicHint;
  final String englishHint;
  @override
  State<RemovableLocalizeTextBuilder> createState() =>
      _RemovableLocalizeTextBuilderState();
}

class _RemovableLocalizeTextBuilderState
    extends State<RemovableLocalizeTextBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.horizontalComponentItemSpacing,
      children: [
        for (int i = 0; i < widget.arabicTextFields.length; i++)
          RemovableLocalizeTextFields(
            initialArabicString: widget.arabicTextFields[i],
            initialEnglishString: widget.englishTextFields[i],
            arabicValidator: widget.arabicValidator,
            englishValidator: widget.englishValidator,
            arabicHint: widget.arabicHint,
            englishHint: widget.englishHint,
            onArabicStringChanged: (value) {
              setState(() {
                widget.arabicTextFields[i] = value ?? '';
              });
            },
            onEnglishStringChanged: (value) {
              setState(() {
                widget.englishTextFields[i] = value ?? '';
              });
            },
            onRemove: () {
              setState(() {
                widget.arabicTextFields.removeAt(i);
                widget.englishTextFields.removeAt(i);
              });
            },
          ),
        Container(),
        AddMoreButton(
          onTap: () {
            setState(() {
              widget.arabicTextFields.add('');
              widget.englishTextFields.add('');
            });
            print("arabic textfields length ${widget.arabicTextFields.length}");
          },
        ),
      ],
    );
  }
}

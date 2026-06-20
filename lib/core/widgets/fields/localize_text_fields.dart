import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field_with_title.dart';
import 'package:training_acedamy/core/widgets/layout_builders/custom_grid_view_builder.dart';

class LocalizeTextFields extends StatelessWidget {
  const LocalizeTextFields({
    required this.arabicTextController,
    required this.englishTextController,
    required this.arabicHint,
    required this.englishHint,
    required this.arabicTitle,
    required this.englishTitle,
    this.isDescription = false,
    this.arabicValidator,
    this.englishValidator,
    super.key,
  });

  final TextEditingController arabicTextController;
  final TextEditingController englishTextController;
  final String arabicHint;
  final String englishHint;
  final String arabicTitle;
  final String englishTitle;
  final bool isDescription;
  final String? Function(String?)? arabicValidator;
  final String? Function(String?)? englishValidator;

  @override
  Widget build(BuildContext context) {
    final fields = ThemeCubit.isEnglish
        ? buildFields()
        : buildFields().reversed.toList();

    return CustomGridViewBuilder(
      numberOfRows: context.responsive.isMobile || isDescription ? 2 : 1,
      widgets: fields,
    );
  }

  List<Widget> buildFields() {
    return [
      Directionality(
        textDirection: TextDirection.ltr,
        child: CustomTextFieldWithTitle(
          title: englishTitle,
          controller: englishTextController,
          hint: englishHint,
          validator: englishValidator,
          maxLines: isDescription ? 5 : 1,
        ),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: CustomTextFieldWithTitle(
          title: arabicTitle,
          controller: arabicTextController,
          hint: arabicHint,
          validator: arabicValidator,
          maxLines: isDescription ? 5 : 1,
        ),
      ),
    ];
  }
}

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
  final String? Function(String?)? arabicValidator;
  final String? Function(String?)? englishValidator;

  @override
  Widget build(BuildContext context) {
    return CustomGridViewBuilder(
      numberOfRows: context.responsive.isMobile ? 2 : 1,
      widgets: ThemeCubit.isEnglish ? fields() : fields().reversed.toList(),
    );
  }

  List<Widget> fields() {
    return [
      Directionality(
        textDirection: TextDirection.ltr,
        child: CustomTextFieldWithTitle(
          title: englishTitle,
          controller: englishTextController,
          hint: englishHint,
          validator: englishValidator,
        ),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: CustomTextFieldWithTitle(
          title: arabicTitle,
          controller: arabicTextController,
          hint: arabicHint,
          validator: arabicValidator,
        ),
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';

import '../../theme/text_styles.dart';

/// if in row use expanded to avoid overflow
class CustomTextFieldWithTitle extends StatelessWidget {
  const CustomTextFieldWithTitle({
    required this.title,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.hint = '',
    this.isExpanded = false,
    this.isReadOnly = false,
    this.keyboardType,
    super.key,
  });
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? maxLength;
  final bool isExpanded;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final String hint;

  /// Function Name: build
  ///
  /// Purpose: Builds the widget tree for the custom text field with a title, wrapping it in Expanded if requested.
  ///
  /// Parameters:
  /// - context: The build context.
  ///
  /// Returns: A Widget representing the built text field.
  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyles.body),
        VerticalSpacer(height: 8),
        CustomTextField(
          controller: controller,
          hintText: hint,
          validator: validator,
          maxLines: maxLines,
          maxLength: maxLength,
          isReadOnly: isReadOnly,
          keyboardType: keyboardType,
        ),
      ],
    );

    if (isExpanded) {
      return Expanded(child: content);
    }

    return content;
  }
}

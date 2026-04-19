/// ****************** FILE INFO ******************
/// File Name: custom_text_field_with_title.dart
/// Purpose: A custom text field widget with a title, with an option to expand to prevent overflow.
/// Author: Mohamed Elrashidy
/// Created At: 05/04/2026

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/custom_text_field.dart';

import '../theme/text_styles.dart';

/// if in row use expanded to avoid overflow
class CustomTextFieldWithTitle extends StatelessWidget {
  const CustomTextFieldWithTitle({
    required this.title,
    required this.controller,
    this.isExpanded = false,
    super.key,
  });
  final String title;
  final TextEditingController controller;
  final bool isExpanded;

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
        Text(title, style: AppTextStyles.bodyLarge),
        CustomTextField(controller: controller),
      ],
    );

    if (isExpanded) {
      return Expanded(child: content);
    }

    return content;
  }
}

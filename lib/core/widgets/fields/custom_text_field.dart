/// ****************** FILE INFO ******************
/// File Name: custom_text_field.dart
/// Purpose: A custom text field widget with predefined styling and focus management.
/// Author: Mohamed Elrashidy
/// Created At: 19/04/2026

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.isReadOnly = false,
    required this.controller,
    this.hintText,
    super.key,
  });
  final bool isReadOnly;
  final TextEditingController controller;
  final String? hintText;

  /// Function Name: build
  ///
  /// Purpose: Builds the custom text field and handles unfocusing when tapping outside.
  ///
  /// Parameters:
  /// - context: The build context.
  ///
  /// Returns: Widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        readOnly: isReadOnly,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          fillColor: AppCustomColor.textFieldFillColor.color,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.sp)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.sp),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppCustomColor.primaryColor.color,
              width: 1.sp,
            ),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.sp),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.sp),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppCustomColor.blackFont.color.withOpacity(0.5),
              width: 1.sp,
            ),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 9.sp,
            vertical: 9.sp,
          ),
        ),
      ),
    );
  }
}

// ****************** FILE INFO ******************
// File Name: custom_text_field.dart
// Purpose: A custom text field widget with predefined styling and optional password visibility toggle.
// Author: Mohamed Elrashidy
// Created At: 19/04/2026

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/fields/custom_form_field.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.isReadOnly = false,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength,
    required this.controller,
    this.hintText,
    this.validator,
    this.autovalidateMode,
    super.key,
  });

  final bool isReadOnly;
  final bool isPassword;
  final int maxLines;
  final int? maxLength;
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  /// Function Name: createState
  ///
  /// Purpose: Creates the mutable state for `CustomTextField`.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: `State<CustomTextField>`
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  /// Function Name: _togglePasswordVisibility
  ///
  /// Purpose: Toggles obscured state for password fields when eye icon is pressed.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: void
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

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
    return CustomFormField<String>(
      initialValue: widget.controller.text,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      childBuilder: (field) {
        return TextField(
          controller: widget.controller,
          readOnly: widget.isReadOnly,
          obscureText: widget.isPassword ? _isObscured : false,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.maxLines > 1
              ? TextInputType.multiline
              : TextInputType.text,
          textAlignVertical: widget.maxLines > 1
              ? TextAlignVertical.top
              : TextAlignVertical.center,
          onChanged: field.didChange,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            fillColor: AppCustomColor.textFieldFillColor.color,
            filled: true,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.hint,
            suffixIcon: widget.isPassword
                ? IconButton(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: AppCustomColor.primaryColor.color,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
            ),
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
                color: AppCustomColor.blackFont.color.withValues(alpha: 0.5),
                width: 1.sp,
              ),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            errorText: field.hasError ? '' : null,
            errorStyle: TextStyle(fontSize: 0, height: 0),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 9.sp,
              vertical: 9.sp,
            ),
          ),
        );
      },
    );
  }
}

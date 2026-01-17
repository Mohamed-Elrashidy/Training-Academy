import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.isReadOnly = false,
    required this.controller,
    super.key,
  });
  final bool isReadOnly;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,

      decoration: InputDecoration(
        fillColor: AppCustomColor.textFieldFillColor.color,
        filled: true,
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
        contentPadding: EdgeInsets.symmetric(horizontal: 9.sp, vertical: 9.sp),
      ),
    );
  }
}

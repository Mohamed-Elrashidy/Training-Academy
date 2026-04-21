import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({this.width, required this.buttonText, super.key});
  final double? width;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.sp,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: AppCustomColor.primaryColor.color,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

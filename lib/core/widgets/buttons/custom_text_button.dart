import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    this.width,
    required this.buttonText,
    this.onTap,
    this.isEnabled = true,
    super.key,
  });
  final double? width;
  final String buttonText;
  final VoidCallback? onTap;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: isEnabled ? 1 : 0.65,
        child: Container(
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
        ),
      ),
    );
  }
}

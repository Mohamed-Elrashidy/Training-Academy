import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

import '../../extensions/extension.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({this.size = 20, this.isSelected = false, super.key});
  final int? size;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size!.sp,
      width: size!.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected
              ? AppCustomColor.primaryColor.color
              : AppCustomColor.greyColor.color,
          width: 1.5,
        ),
        color: isSelected
            ? AppCustomColor.primaryColor.color
            : AppCustomColor.transparent.color,
      ),
      child: Icon(
        Icons.check,
        size: size!.sp - 4,
        color: isSelected
            ? AppCustomColor.whiteColor.color
            : AppCustomColor.greyColor.color,
      ),
    );
  }
}

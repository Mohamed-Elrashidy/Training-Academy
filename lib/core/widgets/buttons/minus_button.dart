import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

import '../../extensions/extension.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({required this.onTap, super.key});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppCustomColor.deleteRed.color,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(4.sp),
        child: Icon(
          Icons.remove,
          color: AppCustomColor.mainContainerColor.color,
          size: 16.sp,
        ),
      ),
    );
  }
}

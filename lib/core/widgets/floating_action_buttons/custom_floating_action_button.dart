import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

import '../../extensions/extension.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: AppCustomColor.primaryColor.color,
      shape: const CircleBorder(),
      child: Icon(icon, size: 32.sp, color: AppTextStyles.body.color),
    );
  }
}

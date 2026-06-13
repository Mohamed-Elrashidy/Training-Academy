import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    required this.title,
    required this.value,
    required this.onChanged,
    this.titleStyle,

    super.key,
  });
  final String title;
  final TextStyle? titleStyle;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.body),
        Switch(
          value: value,
          onChanged: onChanged,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          activeThumbColor: AppCustomColor.primaryColor.color,
          activeTrackColor: AppCustomColor.primaryColor.color.withOpacity(0.5),
          inactiveThumbColor: AppCustomColor.primaryColor.color,
          inactiveTrackColor: AppCustomColor.scaffoldBackground.color,
        ),
      ],
    );
  }
}

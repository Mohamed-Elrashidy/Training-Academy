import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppCustomColor.greyColor.color,
    );
  }
}

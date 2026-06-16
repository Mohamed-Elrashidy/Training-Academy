import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

import '../../extensions/format_numbers.dart';

class NumberTabWidget extends StatelessWidget {
  const NumberTabWidget({
    required this.isSelected,
    required this.number,
    required this.title,
    super.key,
  });
  final bool isSelected;
  final num number;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.sp,
      children: [
        Container(
          width: 32.sp,
          height: 32.sp,
          decoration: BoxDecoration(
            color: isSelected
                ? AppCustomColor.primaryColor.color
                : AppCustomColor.mainContainerColor.color,
            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          ),
          child: Center(
            child: Text(
              number.formatNumber(),
              style: AppTextStyles.body.copyWith(
                color: isSelected
                    ? AppCustomColor.whiteColor.color
                    : AppCustomColor.blackFont.color,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.body.copyWith(
            color: isSelected
                ? AppCustomColor.blackFont.color
                : AppCustomColor.blackFont.color,
          ),
        ),
      ],
    );
  }
}

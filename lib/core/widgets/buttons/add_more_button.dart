import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../extensions/extension.dart';

class AddMoreButton extends StatelessWidget {
  const AddMoreButton({required this.onTap, super.key});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.horizontalComponentItemSpacing,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: AppCustomColor.primaryColor.color,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(2.sp),
            child: Icon(
              Icons.add,
              size: 12.sp,
              color: AppCustomColor.whiteColor.color,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.addMore,
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}

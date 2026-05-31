import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/buttons/custom_text_button.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required this.title,
    required this.description,
    this.submitButtonText,
    this.cancelButtonText,
    this.onSubmit,
    this.onCancel,
    this.showActionButtons = true,
    super.key,
  });

  final String title;
  final String description;
  final String? submitButtonText;
  final String? cancelButtonText;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;
  final bool showActionButtons;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 24.sp),
      child: Container(
        width: context.responsive.isMobile ? double.infinity : 400.sp,

        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: AppCustomColor.scaffoldBackground.color,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: AppTextStyles.titleLarge),
            VerticalSpacer(height: 12),
            Text(
              description,
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
            if (showActionButtons) ...[
              VerticalSpacer(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cancelButtonText != null) ...[
                    CustomTextButton(
                      width: 110.sp,
                      buttonText: cancelButtonText!,
                      onTap: onCancel ?? () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 12.sp),
                  ],
                  if (submitButtonText != null)
                    CustomTextButton(
                      width: 110.sp,
                      buttonText: submitButtonText!,
                      onTap: onSubmit ?? () => Navigator.of(context).pop(),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

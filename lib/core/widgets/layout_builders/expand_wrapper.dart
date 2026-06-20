import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

class ExpandWrapper extends StatefulWidget {
  const ExpandWrapper({required this.title, required this.child, super.key});
  final String title;
  final Widget child;
  @override
  State<ExpandWrapper> createState() => _ExpandWrapperState();
}

class _ExpandWrapperState extends State<ExpandWrapper> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.sp,
      children: [
        Row(
          children: [
            Text(widget.title, style: AppTextStyles.heading3),
            Spacer(),
            GestureDetector(
              onTap: () {
                isExpanded = !isExpanded;
                setState(() {});
              },
              child: Container(
                height: 24.sp,
                width: 24.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppCustomColor.primaryColor.color,
                ),
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: AppCustomColor.whiteColor.color,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
        if (isExpanded) widget.child,
      ],
    );
  }
}

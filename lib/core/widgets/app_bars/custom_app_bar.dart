import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Navigator.canPop(context))
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        Expanded(
          child: Center(child: Text(title, style: AppTextStyles.heading2)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/custom_text_field.dart';

import '../theme/text_styles.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  CustomTextFieldWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title", style: AppTextStyles.heading3),
          CustomTextField(controller: TextEditingController()),
        ],
      ),
    );
  }
}

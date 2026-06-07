import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

class CustomFormField extends FormField<String> {
  CustomFormField({
    required Widget Function(FormFieldState<String> field) childBuilder,
    super.initialValue,
    super.validator,
    super.autovalidateMode,
    super.key,
  }) : super(
         builder: (field) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               childBuilder(field),
               if (field.hasError)
                 Padding(
                   padding: EdgeInsetsDirectional.only(top: 2.sp),
                   child: Text(
                     field.errorText ?? '',
                     style: AppTextStyles.caption.copyWith(color: Colors.red),
                   ),
                 ),
             ],
           );
         },
       );
}

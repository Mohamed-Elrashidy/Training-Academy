import 'package:flutter/material.dart';
import 'package:training_acedamy/core/entities/drop_down/drop_down_entity.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class SingleSelectionDropDown<T> extends StatefulWidget {
  SingleSelectionDropDown({
    required this.items,
    required this.selectedValue,
    super.key,
    this.onChanged,
    this.validator,
    this.hintText,
    this.isReadOnly = false,
  });

  final List<DropDownEntity<T>> items;
  final DropDownEntity<T>? selectedValue;
  final ValueChanged<T?>? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool isReadOnly;

  @override
  State<SingleSelectionDropDown<T>> createState() =>
      _SingleSelectionDropDownState<T>();
}

class _SingleSelectionDropDownState<T>
    extends State<SingleSelectionDropDown<T>> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textController.text = widget.selectedValue?.label ?? "";
    return PopupMenuButton<DropDownEntity<T>>(
      enabled: !widget.isReadOnly,

      itemBuilder: (BuildContext context) {
        return widget.items.map((item) {
          bool isSelected = widget.selectedValue?.value == item.value;
          return PopupMenuItem<DropDownEntity<T>>(
            value: item,

            child: Row(
              spacing: 10.sp,
              children: [
                if (item.icon != null)
                  Icon(
                    item.icon,
                    size: 20.sp,
                    color: AppCustomColor.primaryColor.color,
                  ),
                Text(
                  item.label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isSelected
                        ? AppCustomColor.primaryColor.color
                        : AppCustomColor.blackFont.color,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },

      child: IgnorePointer(
        child: CustomTextField(
          controller: textController,
          isReadOnly: true,
          keyboardType: TextInputType.none,
          hintText: widget.hintText ?? AppLocalizations.of(context)!.choose,
          validator: widget.validator,
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 20.sp,
            color: AppCustomColor.primaryColor.color,
          ),
        ),
      ),
    );
  }

  showMenu() {}
}

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';

import '../../entities/drop_down/drop_down_entity.dart';
import '../../theme/text_styles.dart';
import 'single_selection_drop_down.dart';

/// if in row use expanded to avoid overflow
class SingleSelectionDropDownWithTitle<T> extends StatelessWidget {
  const SingleSelectionDropDownWithTitle({
    required this.title,
    required this.items,
    this.selectedValue,
    this.validator,
    this.hint,
    this.isExpanded = false,
    this.isReadOnly = false,
    this.keyboardType,
    super.key,
  });
  final String title;
  final String? Function(String?)? validator;
  final bool isExpanded;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final String? hint;
  final List<DropDownEntity<T>> items;
  final DropDownEntity<T>? selectedValue;

  /// Function Name: build
  ///
  /// Purpose: Builds the widget tree for the custom text field with a title, wrapping it in Expanded if requested.
  ///
  /// Parameters:
  /// - context: The build context.
  ///
  /// Returns: A Widget representing the built text field.
  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyles.body),
        VerticalSpacer(height: 8),
        SingleSelectionDropDown(
          hintText: hint,
          validator: validator,
          isReadOnly: isReadOnly,
          items: items,
          selectedValue: selectedValue,
        ),
      ],
    );

    if (isExpanded) {
      return Expanded(child: content);
    }

    return content;
  }
}

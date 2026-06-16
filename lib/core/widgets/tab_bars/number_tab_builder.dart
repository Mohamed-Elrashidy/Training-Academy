import 'package:flutter/material.dart';

import '../../extensions/extension.dart';
import 'number_tab_widget.dart';

class NumberTabBuilder<T> extends StatelessWidget {
  const NumberTabBuilder({
    required this.getTitle,
    required this.getNumber,
    required this.onSelect,
    required this.selectedValue,
    required this.items,
    super.key,
  });
  final List<T> items;
  final String Function(T) getTitle;
  final int Function(T) getNumber;
  final void Function(T) onSelect;
  final T selectedValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 32.sp,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (T item in items)
            GestureDetector(
              onTap: () => onSelect(item),
              child: NumberTabWidget(
                title: getTitle(item),
                number: getNumber(item),
                isSelected: selectedValue == item,
              ),
            ),
        ],
      ),
    );
  }
}

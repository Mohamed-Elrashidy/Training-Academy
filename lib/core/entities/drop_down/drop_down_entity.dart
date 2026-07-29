import 'package:flutter/cupertino.dart';

class DropDownEntity<T> {
  final String label;
  final T value;
  final String? svgIcon;
  final IconData? icon;

  DropDownEntity({
    required this.label,
    required this.value,
    this.svgIcon,
    this.icon,
  });
}

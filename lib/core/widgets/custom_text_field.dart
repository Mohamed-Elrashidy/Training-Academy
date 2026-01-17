import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.isReadOnly = false,
    required this.controller,
    super.key,
  });
  bool isReadOnly;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller, readOnly: isReadOnly);
  }
}

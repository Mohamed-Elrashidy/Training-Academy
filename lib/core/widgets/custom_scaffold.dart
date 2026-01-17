import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({required this.body, super.key});
  Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustomColor.scaffoldBackground.color,
      body: Padding(padding: EdgeInsets.all(16.sp), child: body),
    );
  }
}

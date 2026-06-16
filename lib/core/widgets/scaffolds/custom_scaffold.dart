import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';

import '../../theme/app_custom_color.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({
    required this.body,
    this.usePadding = true,
    this.floatingActionButton,
    super.key,
  });
  Widget body;
  bool usePadding;
  Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustomColor.scaffoldBackground.color,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(usePadding ? 16.sp : 0),
          child: body,
        ),
      ),
    );
  }
}

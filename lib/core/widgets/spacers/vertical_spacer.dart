/// ****************** FILE INFO ******************
/// File Name: vertical_spacer.dart
/// Purpose: A responsive vertical spacer using AppSizeCheckpointsManager.
/// Author: Mohamed Elrashidy
/// Created At: 19/04/2026

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_size_checkpoints.dart';

class VerticalSpacer extends StatelessWidget {
  final double height;

  const VerticalSpacer({super.key, required this.height});

  /// Function Name: build
  ///
  /// Purpose: Builds the responsive vertical SizedBox.
  ///
  /// Parameters:
  /// - context: BuildContext for the widget.
  ///
  /// Returns: Widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * AppSizeCheckpointsManager.fontSizeMultiplier(),
    );
  }
}

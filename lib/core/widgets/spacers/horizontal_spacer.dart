/// ****************** FILE INFO ******************
/// File Name: horizontal_spacer.dart
/// Purpose: A responsive horizontal spacer using AppSizeCheckpointsManager.
/// Author: Mohamed Elrashidy
/// Created At: 19/04/2026

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_size_checkpoints.dart';

class HorizontalSpacer extends StatelessWidget {
  final double width;

  const HorizontalSpacer({super.key, required this.width});

  /// Function Name: build
  ///
  /// Purpose: Builds the responsive horizontal SizedBox.
  ///
  /// Parameters:
  /// - context: BuildContext for the widget.
  ///
  /// Returns: Widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * AppSizeCheckpointsManager.fontSizeMultiplier(),
    );
  }
}

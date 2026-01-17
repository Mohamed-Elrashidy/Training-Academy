import 'package:training_acedamy/core/theme/app_size_checkpoints.dart';

extension ResponsiveSizeExtension on int {
  double get sp => AppSizeCheckpointsManager.fontSizeMultiplier() * this;
}

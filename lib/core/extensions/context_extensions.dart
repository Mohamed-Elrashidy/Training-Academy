import 'package:flutter/cupertino.dart';

import '../theme/app_size_checkpoints.dart';

extension DeviceType on BuildContext {
  bool get isMobile => MediaQuery.sizeOf(this).width < 600;
  bool get isTablet =>
      MediaQuery.sizeOf(this).width >= 600 &&
      MediaQuery.sizeOf(this).width < 1200;
  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1200;
  bool get isLargeDesktop => MediaQuery.sizeOf(this).width >= 1440;
}

extension Responsive on BuildContext {
  double get verticalComponentItemsSpacing =>
      AppSizeCheckpointsManager.fontSizeMultiplier() * 8;
  double get horizontalComponentItemSpacing =>
      AppSizeCheckpointsManager.fontSizeMultiplier() * 8;
  double get horizontalComponentTitleAndComponentsSpacing =>
      AppSizeCheckpointsManager.fontSizeMultiplier() * 16;
  double get componentsSpacing =>
      AppSizeCheckpointsManager.fontSizeMultiplier() * 24;
}

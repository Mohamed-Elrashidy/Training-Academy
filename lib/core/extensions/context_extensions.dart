import 'package:flutter/cupertino.dart';

import '../theme/app_size_checkpoints.dart';

class ResponsiveContextValue {
  const ResponsiveContextValue(this.context);

  final BuildContext context;

  Size get size => MediaQuery.sizeOf(context);
  double get width => size.width;
  double get height => size.height;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1200;
  bool get isDesktop => width >= 1200;
  bool get isLargeDesktop => width >= 1440;

  double scale(num value) =>
      AppSizeCheckpointsManager.fontSizeMultiplier() * value;
}

extension DeviceType on BuildContext {
  bool get isMobile => responsive.isMobile;
  bool get isTablet => responsive.isTablet;
  bool get isDesktop => responsive.isDesktop;
  bool get isLargeDesktop => responsive.isLargeDesktop;
}

extension ResponsiveContextExtension on BuildContext {
  ResponsiveContextValue get responsive => ResponsiveContextValue(this);
}

extension Responsive on BuildContext {
  double get verticalComponentItemsSpacing => responsive.scale(8);
  double get horizontalComponentItemSpacing => responsive.scale(8);
  double get horizontalComponentTitleAndComponentsSpacing =>
      responsive.scale(16);
  double get componentsSpacing => responsive.scale(24);
  double get mainContainerBorderRadius => responsive.scale(16);
  double get smallContainerBorderRadius => responsive.scale(8);
}

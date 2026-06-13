import 'package:flutter/material.dart';

import '../configurations/app_navigator_key.dart';

class AppSizeCheckpointsManager {
  static const double smallPhoneMaxWidth = 320.0;
  static const double mediumPhoneMaxWidth = 375.0;
  static const double largePhoneMaxWidth = 414.0;
  static const double tabletMinWidth = 600.0;
  static const double desktopMinWidth = 1024.0;
  static const double largeDesktopMinWidth = 1440.0;

  /// Function Name: getWidth
  ///
  /// Purpose: Get screen width from BuildContext using MediaQuery (safe method).
  ///
  /// Parameters:
  /// - context: BuildContext to read MediaQuery from.
  ///
  /// Returns: double - screen width in logical pixels
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Function Name: width
  ///
  /// Purpose: Get screen width from global navigator key (fallback to default if unavailable).
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: double - screen width in logical pixels
  static double get width {
    final context = appMainNavigatorKey.currentContext;
    if (context == null) return largePhoneMaxWidth; // Default before UI renders

    // Try MediaQuery first (more reliable)
    try {
      return MediaQuery.of(context).size.width;
    } catch (e) {
      // Fallback to RenderBox size if MediaQuery not available
      final size = context.size;
      if (size == null) return largePhoneMaxWidth;
      return size.width;
    }
  }

  static bool isSmallPhone() {
    return width <= smallPhoneMaxWidth;
  }

  static bool isMediumPhone() {
    return width > smallPhoneMaxWidth && width <= mediumPhoneMaxWidth;
  }

  static bool isLargePhone() {
    return width > mediumPhoneMaxWidth && width <= largePhoneMaxWidth;
  }

  static bool isTablet() {
    return width >= tabletMinWidth && width < desktopMinWidth;
  }

  static bool isDesktop() {
    return width >= desktopMinWidth && width < largeDesktopMinWidth;
  }

  static bool isLargeDesktop() {
    return width >= largeDesktopMinWidth;
  }

  static double fontSizeMultiplier() {
    if (isSmallPhone()) {
      return 0.8;
    } else if (isMediumPhone()) {
      return 0.9;
    } else if (isLargePhone()) {
      return 1.0;
    } else if (isTablet()) {
      return 1.1;
    } else if (isDesktop()) {
      return 1.2;
    } else {
      return 1.3;
    }
  }
}

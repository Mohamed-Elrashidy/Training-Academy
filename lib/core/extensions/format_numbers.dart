import 'package:flutter/material.dart';
import 'package:training_acedamy/core/configurations/app_navigator_key.dart';

extension FormatNumber on num {
  String formatNumber() {
    return truncateNumber().localizeNumber();
  }

  String localizeNumber() {
    final context = appMainNavigatorKey.currentContext;
    if (context == null) {
      return toString();
    }

    final languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode != 'ar') {
      return toString();
    }

    return toString().replaceAllMapped(RegExp(r'\d'), (match) {
      switch (match.group(0)) {
        case '0':
          return '٠';
        case '1':
          return '١';
        case '2':
          return '٢';
        case '3':
          return '٣';
        case '4':
          return '٤';
        case '5':
          return '٥';
        case '6':
          return '٦';
        case '7':
          return '٧';
        case '8':
          return '٨';
        case '9':
          return '٩';
      }

      return match.group(0) ?? '';
    });
  }

  num truncateNumber() {
    final value = toDouble();
    if (value == value.roundToDouble()) {
      return value.toInt();
    }

    return double.parse(value.toStringAsFixed(2));
  }
}

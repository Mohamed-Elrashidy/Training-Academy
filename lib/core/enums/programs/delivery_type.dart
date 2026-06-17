import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../configurations/app_navigator_key.dart';

enum DeliveryType {
  onsite,
  offline;

  String get displayName {
    final BuildContext context = appMainNavigatorKey.currentContext!;
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case DeliveryType.offline:
        return l10n.offline;
      case DeliveryType.onsite:
        return l10n.onsite;
    }
  }

  String get databaseName {
    switch (this) {
      case DeliveryType.onsite:
        return "onsite";
      case DeliveryType.offline:
        return "offline";
    }
  }
}

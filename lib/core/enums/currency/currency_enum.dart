import 'package:flutter/cupertino.dart';

import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

enum CurrencyEnum {
  egp,
  usd,
  euro,
  sterling,
  sar;

  String get code {
    switch (this) {
      case CurrencyEnum.egp:
        return 'EGP';
      case CurrencyEnum.usd:
        return 'USD';
      case CurrencyEnum.euro:
        return 'EUR';
      case CurrencyEnum.sterling:
        return 'GBP';
      case CurrencyEnum.sar:
        return 'SAR';
    }
  }

  String get disPlayName {
    BuildContext context = appMainNavigatorKey.currentContext!;
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case CurrencyEnum.egp:
        return l10n.egyptianPound;
      case CurrencyEnum.usd:
        return l10n.usDollar;
      case CurrencyEnum.euro:
        return l10n.euroCurrency;
      case CurrencyEnum.sterling:
        return l10n.britishPound;
      case CurrencyEnum.sar:
        return l10n.saudiRiyal;
    }
  }

  String get databaseName {
    switch (this) {
      case CurrencyEnum.egp:
        return 'egp';
      case CurrencyEnum.usd:
        return 'usd';
      case CurrencyEnum.euro:
        return 'euro';
      case CurrencyEnum.sterling:
        return 'sterling';
      case CurrencyEnum.sar:
        return 'sar';
    }
  }
}

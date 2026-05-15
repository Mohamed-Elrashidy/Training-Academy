import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/data_source.dart';

import '../../l10n/app_localizations.dart';

abstract class ApiErrorHandler {
  static ApiErrorModel handleApiError(DataSource dataSource) {
    switch (dataSource) {
      case DataSource.emailAlreadyInUse:
        return ApiErrorModel(
          message: AppLocalizations.current.emailAlreadyInUse,
          code: 'email-already-in-use',
        );
    }
  }
}

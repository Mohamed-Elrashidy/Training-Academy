import 'package:dio/dio.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/data_source.dart';
import 'package:training_acedamy/training_academy_app.dart';

import '../../l10n/app_localizations.dart';

abstract class ErrorHandler {
  static ApiErrorModel handleApiError(DataSource dataSource) {
    switch (dataSource) {
      case DataSource.emailAlreadyInUse:
        return ApiErrorModel(
          message: AppLocalizations.of(
            appMainNavigatorKey.currentContext!,
          )!.emailAlreadyInUse,
          code: 'email-already-in-use',
        );
      case DataSource.invalidCredentials:
        return ApiErrorModel(
          message: AppLocalizations.of(
            appMainNavigatorKey.currentContext!,
          )!.invalidCredentials,
          code: 'invalid-credentials',
        );
      case DataSource.accountInactive:
        return ApiErrorModel(
          message: AppLocalizations.of(
            appMainNavigatorKey.currentContext!,
          )!.accountInactive,
          code: 'account-inactive',
        );
    }
  }

  static ApiErrorModel handleError(Object error) {
    if (error is DioException) {
      final responseData = error.response?.data;
      if (responseData is Map<String, dynamic>) {
        return ApiErrorModel(
          message:
              responseData['message']?.toString() ??
              responseData['error_description']?.toString() ??
              error.message ??
              'Unexpected network error',
          code:
              responseData['code']?.toString() ??
              error.response?.statusCode?.toString() ??
              'dio-error',
        );
      }

      return ApiErrorModel(
        message: error.message ?? 'Unexpected network error',
        code: error.response?.statusCode?.toString() ?? 'dio-error',
      );
    }

    return ApiErrorModel(message: error.toString(), code: 'unexpected-error');
  }
}

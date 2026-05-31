import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';
import 'package:training_acedamy/core/configurations/backend_providers.dart';
import 'package:training_acedamy/core/helpers/security/password_hash_helper.dart';
import 'package:training_acedamy/features/authentication/data/data_source/remote_data_source/authentication_remote_data_source.dart';
import 'package:training_acedamy/features/authentication/data/data_source/remote_data_source/supabase_authentication_remote_data_source.dart';
import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';

import '../../../../core/enums/accounts/account_status.dart';
import '../../../../core/network/api_error_model.dart';
import '../../../../core/network/data_source.dart';
import '../../../../core/network/error_handler.dart';

class AuthenticationRepository {
  AuthenticationRemoteDataSource? _authenticationRemoteDataSource;

  AuthenticationRemoteDataSource get authenticationRemoteDataSource {
    if (_authenticationRemoteDataSource != null) {
      return _authenticationRemoteDataSource!;
    }

    if (AppConfigurations.backendService == BackendProviders.SUPABASE) {
      _authenticationRemoteDataSource =
          SupabaseAuthenticationRemoteDataSource();
      return _authenticationRemoteDataSource!;
    }

    throw StateError('Unsupported authentication backend service.');
  }

  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Either<ApiErrorModel, dynamic> result = await authenticationRemoteDataSource
        .getAccountCredentials(email: email);
    if (result.isLeft) {
      return result;
    }
    Map<String, dynamic> credentialsData = _extractCredentialMap(
      result.getOrElse(() => {}),
    );
    if (credentialsData.isEmpty) {
      return Left(ErrorHandler.handleApiError(DataSource.invalidCredentials));
    }
    CredentialModel credential = CredentialModel.fromMap(credentialsData);
    String hashedInputPassword = PasswordHashHelper.hashPassword(
      password: password,
      salt: credential.passwordKey,
    );
    if (hashedInputPassword != credential.password) {
      return Left(ErrorHandler.handleApiError(DataSource.invalidCredentials));
    }
    if (credential.accountStatus != AccountStatus.active) {
      return Left(ErrorHandler.handleApiError(DataSource.accountInactive));
    }
    return Right(credential);
  }

  Map<String, dynamic> _extractCredentialMap(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      return responseData;
    }

    if (responseData is List && responseData.isNotEmpty) {
      final firstItem = responseData.first;
      if (firstItem is Map) {
        return Map<String, dynamic>.from(firstItem);
      }
    }

    return <String, dynamic>{};
  }
}

import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';
import 'package:training_acedamy/core/configurations/backend_providers.dart';
import 'package:training_acedamy/core/enums/accounts/user_type.dart';
import 'package:training_acedamy/core/helpers/security/password_hash_helper.dart';
import 'package:training_acedamy/features/authentication/data/data_source/remote_data_source/authentication_remote_data_source.dart';
import 'package:training_acedamy/features/authentication/data/data_source/remote_data_source/supabase_authentication_remote_data_source.dart';
import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';

import '../../../../core/enums/accounts/account_status.dart';
import '../../../../core/network/api_error_model.dart';
import '../../../../core/network/data_source.dart';
import '../../../../core/network/error_handler.dart';

class AuthenticationRepository {
  AuthenticationRepository() {
    if (AppConfigurations.backendService == BackendProviders.SUPABASE) {
      authenticationRemoteDataSource = SupabaseAuthenticationRemoteDataSource();
    }
  }
  late AuthenticationRemoteDataSource authenticationRemoteDataSource;

  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Either<ApiErrorModel, dynamic> result = await authenticationRemoteDataSource
        .getAccountCredentials(email: email);
    if (result.isLeft) {
      return result;
    }
    Map<String, dynamic> credentialsData = result.getOrElse(() => {});
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

  Future<Either<ApiErrorModel, dynamic>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required UserType userType,
  }) async {
    Either<ApiErrorModel, dynamic> emailCheckResult =
        await _checkEmailAlreadyInUse(email);
    if (emailCheckResult.isLeft) {
      return emailCheckResult;
    }
    String hashKey = PasswordHashHelper.generateSalt();
    String hashedPassword = PasswordHashHelper.hashPassword(
      password: password,
      salt: hashKey,
    );
    CredentialModel credential = CredentialModel(
      email: email,
      password: hashedPassword,
      passwordKey: hashKey,
      userType: userType,
      accountStatus: AccountStatus.active,
    );

    return await authenticationRemoteDataSource.signUpWithEmailAndPassword(
      credential: credential,
    );
  }

  Future<Either<ApiErrorModel, dynamic>> _checkEmailAlreadyInUse(
    String email,
  ) async {
    Either<ApiErrorModel, dynamic> emailCheckResult =
        await authenticationRemoteDataSource.getAccountCredentials(
          email: email,
        );
    if (emailCheckResult.isLeft) {
      return emailCheckResult;
    }
    Map<String, dynamic> credentialsData = emailCheckResult.getOrElse(() => {});
    if (credentialsData.isNotEmpty) {
      return Left(ErrorHandler.handleApiError(DataSource.emailAlreadyInUse));
    }
    return Right(null);
  }
}

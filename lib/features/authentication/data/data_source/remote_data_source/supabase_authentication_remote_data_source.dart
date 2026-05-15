import 'package:dart_either/src/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';

import 'authentication_remote_data_source.dart';

class SupabaseAuthenticationRemoteDataSource
    extends AuthenticationRemoteDataSource {
  @override
  Future<Either<ApiErrorModel, dynamic>> getAccountCredentials({
    required String email,
  }) {
    // TODO: implement getAccountCredentials
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiErrorModel, dynamic>> signUpWithEmailAndPassword({
    CredentialModel? credential,
  }) {
    throw UnimplementedError();
  }
}

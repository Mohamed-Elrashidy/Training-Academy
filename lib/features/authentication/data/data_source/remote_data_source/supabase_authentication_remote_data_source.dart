import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/dio_handler.dart';
import 'package:training_acedamy/core/network/supbapase_constants.dart';
import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';

import 'authentication_remote_data_source.dart';

class SupabaseAuthenticationRemoteDataSource
    extends AuthenticationRemoteDataSource {
  final DioHandler _supabaseClient = DioHandler.supabase();

  @override
  Future<Either<ApiErrorModel, dynamic>> getAccountCredentials({
    required String email,
  }) async {
    return await _supabaseClient.getRequest(
      SupbapaseConstants.credentialsTableName,
      queryParameters: {
        'select': '*',
        CredentialModel.emailField: 'eq.$email',
        'limit': 1,
      },
    );
  }
}

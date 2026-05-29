import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/dio_handler.dart';
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
      CredentialModel.tableName,
      queryParameters: {
        'select': '*',
        CredentialModel.emailField: 'eq.$email',
        'limit': 1,
      },
    );
  }

  @override
  Future<Either<ApiErrorModel, dynamic>> signUpWithEmailAndPassword({
    CredentialModel? credential,
  }) async {
    if (credential == null) {
      return Left(
        ApiErrorModel(
          message: 'Credential payload is required.',
          code: 'missing-credential-payload',
        ),
      );
    }

    final response = await _supabaseClient.postRequest(
      CredentialModel.tableName,
      data: credential.toMap(),
      queryParameters: {'select': '*'},
      headers: {'Prefer': 'return=representation'},
    );

    return response.fold(
      ifLeft: (error) => Left(error),
      ifRight: (responseData) {
        if (responseData is List && responseData.isNotEmpty) {
          return Right(Map<String, dynamic>.from(responseData.first as Map));
        }

        if (responseData is Map<String, dynamic>) {
          return Right(responseData);
        }

        return Right(credential.toMap());
      },
    );
  }
}

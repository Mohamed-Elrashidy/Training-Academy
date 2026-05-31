import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/dio_handler.dart';

import 'signup_remote_data_source.dart';

class SupabaseSignupRemoteDataSource extends SignupRemoteDataSource {
  final DioHandler _supabaseClient = DioHandler.supabase();

  @override
  Future<Either<ApiErrorModel, dynamic>> signupClient({
    required String email,
    required String password,
    required String passwordKey,
    required String firstName,
    required String lastName,
  }) async {
    return await _supabaseClient.rpcRequest(
      'signup_client',
      data: {
        'p_email': email,
        'p_password': password,
        'p_password_key': passwordKey,
        'p_first_name': firstName,
        'p_last_name': lastName,
      },
    );
  }
}

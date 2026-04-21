import 'package:dart_either/src/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';

import 'authentication_remote_data_source.dart';

class SupabaseAuthenticationRemoteDataSource
    extends AuthenticationRemoteDataSource {
  @override
  Future<Either<ApiErrorModel, dynamic>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiErrorModel, dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}

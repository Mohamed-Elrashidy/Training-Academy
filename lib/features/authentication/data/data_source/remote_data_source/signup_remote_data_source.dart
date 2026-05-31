import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';

abstract class SignupRemoteDataSource {
  Future<Either<ApiErrorModel, dynamic>> signupClient({
    required String email,
    required String password,
    required String passwordKey,
    required String firstName,
    required String lastName,
  });
}

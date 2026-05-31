import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Either<ApiErrorModel, dynamic>> getAccountCredentials({
    required String email,
  });
}

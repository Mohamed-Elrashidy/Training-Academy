import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Either<ApiErrorModel, dynamic>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<ApiErrorModel, dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String userType,
  });
}

import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';
import 'package:training_acedamy/core/configurations/backend_providers.dart';
import 'package:training_acedamy/core/helpers/security/password_hash_helper.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/authentication/data/data_source/remote_data_source/signup_remote_data_source.dart';
import 'package:training_acedamy/features/authentication/data/data_source/remote_data_source/supabase_signup_remote_data_source.dart';
import 'package:training_acedamy/features/authentication/data/models/signup_result_model.dart';

class SignupRepository {
  SignupRemoteDataSource? _signupRemoteDataSource;

  SignupRemoteDataSource get signupRemoteDataSource {
    if (_signupRemoteDataSource != null) {
      return _signupRemoteDataSource!;
    }

    if (AppConfigurations.backendService == BackendProviders.SUPABASE) {
      _signupRemoteDataSource = SupabaseSignupRemoteDataSource();
      return _signupRemoteDataSource!;
    }

    throw StateError('Unsupported signup backend service.');
  }

  Future<Either<ApiErrorModel, SignupResultModel>> signupClient({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final hashKey = PasswordHashHelper.generateSalt();
    final hashedPassword = PasswordHashHelper.hashPassword(
      password: password,
      salt: hashKey,
    );

    final result = await signupRemoteDataSource.signupClient(
      email: email,
      password: hashedPassword,
      passwordKey: hashKey,
      firstName: firstName,
      lastName: lastName,
    );

    return result.fold(
      ifLeft: (error) => Left(error),
      ifRight: (data) => Right(
        SignupResultModel.fromMap(Map<String, dynamic>.from(data as Map)),
      ),
    );
  }
}

import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';

abstract class ClientAccountRemoteDataSource {
  Future<Either<ApiErrorModel, dynamic>> getClientAccount({
    required String credentialId,
  });
}

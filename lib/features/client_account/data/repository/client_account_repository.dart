import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';
import 'package:training_acedamy/core/configurations/backend_providers.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/client_account/data/data_source/remote_data_source/client_account_remote_data_source.dart';
import 'package:training_acedamy/features/client_account/data/data_source/remote_data_source/supabase_client_account_remote_data_source.dart';
import 'package:training_acedamy/features/client_account/domain/entity/client_account_entity.dart';
import 'package:training_acedamy/features/shared/profiles/data/models/client_account_model.dart';

class ClientAccountRepository {
  ClientAccountRemoteDataSource? _remoteDataSource;

  ClientAccountRemoteDataSource get remoteDataSource {
    if (_remoteDataSource != null) {
      return _remoteDataSource!;
    }

    if (AppConfigurations.backendService == BackendProviders.SUPABASE) {
      _remoteDataSource = SupabaseClientAccountRemoteDataSource();
      return _remoteDataSource!;
    }

    throw StateError('Unsupported client account backend service.');
  }

  Future<Either<ApiErrorModel, ClientAccountEntity>> getClientAccount({
    required String credentialId,
  }) async {
    final result = await remoteDataSource.getClientAccount(
      credentialId: credentialId,
    );

    return result.fold(
      ifLeft: (error) => Left(error),
      ifRight: (data) {
        final accountMap = _extractAccountMap(data);
        if (accountMap == null) {
          return Left(
            ApiErrorModel(
              message: 'Unable to load client account data.',
              code: 'client-account-not-found',
            ),
          );
        }

        final model = ClientAccountModel.fromMap(accountMap);
        if ((model.id ?? '').isEmpty) {
          return Left(
            ApiErrorModel(
              message: 'Unable to load client account data.',
              code: 'client-account-not-found',
            ),
          );
        }

        return Right(
          ClientAccountEntity(
            id: model.id!,
            credentialId: model.credentialId,
            createdAt: model.createdAt,
            firstName: model.firstName,
            lastName: model.lastName,
            email: model.email,
            middleName: model.middleName,
            birthDate: model.birthDate,
            phoneNumber: model.phoneNumber,
            profilePictureUrl: model.profilePictureUrl,
          ),
        );
      },
    );
  }

  Map<String, dynamic>? _extractAccountMap(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      return responseData;
    }

    if (responseData is List && responseData.isNotEmpty) {
      final firstItem = responseData.first;
      if (firstItem is Map) {
        return Map<String, dynamic>.from(firstItem);
      }
    }

    return null;
  }
}

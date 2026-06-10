import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/dio_handler.dart';
import 'package:training_acedamy/core/network/supbapase_constants.dart';
import 'package:training_acedamy/features/client_account/data/data_source/remote_data_source/client_account_remote_data_source.dart';
import 'package:training_acedamy/features/shared/profiles/data/models/client_account_model.dart';

class SupabaseClientAccountRemoteDataSource
    extends ClientAccountRemoteDataSource {
  final DioHandler _supabaseClient = DioHandler.supabase();

  @override
  Future<Either<ApiErrorModel, dynamic>> getClientAccount({
    required String credentialId,
  }) async {
    return _supabaseClient.getRequest(
      SupbapaseConstants.clientAccountsTableName,
      queryParameters: {
        'select': '*',
        ClientAccountModel.credentialIdField: 'eq.$credentialId',
        'limit': 1,
      },
    );
  }
}

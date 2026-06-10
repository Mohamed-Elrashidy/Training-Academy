import 'package:dart_either/dart_either.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/employee_layout/domain/entity/employee_account_entity.dart';

class EmployeeAccountRepository {
  Future<Either<ApiErrorModel, EmployeeAccountEntity>> getEmployeeAccount({
    required String credentialId,
    required String email,
  }) async {
    return Left(
      ApiErrorModel(
        message: 'Employee account loading is not implemented yet.',
        code: 'employee-account-not-implemented',
      ),
    );
  }
}

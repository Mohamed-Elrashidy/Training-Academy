import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/enums/accounts/user_type.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';
import 'package:training_acedamy/features/employee_layout/data/repository/employee_account_repository.dart';
import 'package:training_acedamy/features/employee_layout/domain/entity/employee_account_entity.dart';

part 'employee_account_state.dart';

class EmployeeAccountCubit extends Cubit<EmployeeAccountState> {
  EmployeeAccountCubit({required this.repository})
    : super(EmployeeAccountInitialState());

  final EmployeeAccountRepository repository;

  Future<void> initializeAccount({required CredentialModel? credential}) async {
    if (credential == null || (credential.id ?? '').isEmpty) {
      emit(
        EmployeeAccountFailureState(
          ApiErrorModel(
            message: 'Unable to load your session. Please sign in again.',
            code: 'missing-auth-credential',
          ),
        ),
      );
      return;
    }

    if (credential.userType != UserType.employee) {
      emit(
        EmployeeAccountFailureState(
          ApiErrorModel(
            message: 'This account does not belong to the employee flow.',
            code: 'invalid-employee-account-type',
          ),
        ),
      );
      return;
    }

    emit(EmployeeAccountLoadingState());

    final result = await repository.getEmployeeAccount(
      credentialId: credential.id!,
      email: credential.email,
    );

    result.fold(
      ifLeft: (error) => emit(EmployeeAccountFailureState(error)),
      ifRight: (account) => emit(
        EmployeeAccountSuccessState(credential: credential, account: account),
      ),
    );
  }

  EmployeeAccountEntity? get currentAccount {
    final currentState = state;
    if (currentState is EmployeeAccountSuccessState) {
      return currentState.account;
    }

    return null;
  }
}

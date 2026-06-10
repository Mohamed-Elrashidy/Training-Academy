part of 'employee_account_cubit.dart';

sealed class EmployeeAccountState {}

final class EmployeeAccountInitialState extends EmployeeAccountState {}

final class EmployeeAccountLoadingState extends EmployeeAccountState {}

final class EmployeeAccountSuccessState extends EmployeeAccountState {
  final CredentialModel credential;
  final EmployeeAccountEntity account;

  EmployeeAccountSuccessState({
    required this.credential,
    required this.account,
  });
}

final class EmployeeAccountFailureState extends EmployeeAccountState {
  final ApiErrorModel error;

  EmployeeAccountFailureState(this.error);
}

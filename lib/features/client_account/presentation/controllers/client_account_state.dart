part of 'client_account_cubit.dart';

sealed class ClientAccountState {}

final class ClientAccountInitialState extends ClientAccountState {}

final class ClientAccountLoadingState extends ClientAccountState {}

final class ClientAccountSuccessState extends ClientAccountState {
  final CredentialModel credential;
  final ClientAccountEntity account;

  ClientAccountSuccessState({required this.credential, required this.account});
}

final class ClientAccountFailureState extends ClientAccountState {
  final ApiErrorModel error;

  ClientAccountFailureState(this.error);
}

import '../../../../core/enums/accounts/account_status.dart';

class CredentialModel {
  final String email;
  final String password;
  final String passwordKey;
  final AccountStatus accountStatus;

  CredentialModel({
    required this.email,
    required this.password,
    required this.passwordKey,
    required this.accountStatus,
  });
}

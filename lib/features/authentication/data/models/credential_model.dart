import 'package:training_acedamy/core/enums/accounts/user_type.dart';

import '../../../../core/enums/accounts/account_status.dart';

class CredentialModel {
  final String email;
  final String password;
  final String passwordKey;
  final AccountStatus accountStatus;
  DateTime? accessStartTime;
  DateTime? accessEndTime;
  UserType userType;

  CredentialModel({
    required this.email,
    required this.password,
    required this.passwordKey,
    required this.accountStatus,
    required this.userType,
    this.accessStartTime,
    this.accessEndTime,
  });

  static const String collectionName = 'Credentials';
  static const String emailField = 'email';
  static const String passwordField = 'password';
  static const String passwordKeyField = 'password_key';
  static const String accountStatusField = 'account_status';
  static const String userTypeField = 'user_type';
  static const String accessStartTimeField = 'access_start_time';
  static const String accessEndTimeField = 'access_end_time';

  toMap() {
    return {
      emailField: email,
      passwordField: password,
      passwordKeyField: passwordKey,
      accountStatusField: accountStatus.name,
      userTypeField: userType.databaseName,
      accessStartTimeField: accessStartTime?.toIso8601String(),
      accessEndTimeField: accessEndTime?.toIso8601String(),
    };
  }

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      email: map[emailField],
      password: map[passwordField],
      passwordKey: map[passwordKeyField],
      accountStatus: AccountStatus.values.firstWhere(
        (e) =>
            e.name.toLowerCase() ==
            map[accountStatusField].toString().toLowerCase(),
        orElse: () => AccountStatus.inactive,
      ),
      userType: UserType.values.firstWhere(
        (e) => e.databaseName == map[userTypeField](),
        orElse: () => UserType.client,
      ),
      accessStartTime: map[accessStartTimeField] != null
          ? DateTime.parse(map[accessStartTimeField])
          : null,
      accessEndTime: map[accessEndTimeField] != null
          ? DateTime.parse(map[accessEndTimeField])
          : null,
    );
  }
}

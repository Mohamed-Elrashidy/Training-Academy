import 'package:training_acedamy/core/enums/accounts/user_type.dart';

import '../../../../core/enums/accounts/account_status.dart';

class CredentialModel {
  final String? id;
  final DateTime? createdAt;
  final String email;
  final String password;
  final String passwordKey;
  final AccountStatus accountStatus;
  final DateTime? accessStartTime;
  final DateTime? accessEndTime;
  final UserType userType;

  CredentialModel({
    this.id,
    this.createdAt,
    required this.email,
    required this.password,
    required this.passwordKey,
    required this.accountStatus,
    required this.userType,
    this.accessStartTime,
    this.accessEndTime,
  });

  static const String tableName = 'credentials';
  static const String collectionName = tableName;
  static const String idField = 'id';
  static const String createdAtField = 'created_at';
  static const String emailField = 'email';
  static const String passwordField = 'password';
  static const String passwordKeyField = 'password_key';
  static const String accountStatusField = 'account_status';
  static const String userTypeField = 'user_type';
  static const String accessStartTimeField = 'access_start_time';
  static const String accessEndTimeField = 'access_end_time';

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      idField: id,
      createdAtField: createdAt?.toIso8601String(),
      emailField: email,
      passwordField: password,
      passwordKeyField: passwordKey,
      accountStatusField: accountStatus.name,
      userTypeField: userType.databaseName,
      accessStartTimeField: accessStartTime?.toIso8601String(),
      accessEndTimeField: accessEndTime?.toIso8601String(),
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    final userTypeValue = map[userTypeField]?.toString().toLowerCase();

    return CredentialModel(
      id: map[idField]?.toString(),
      createdAt: _parseDateTime(map[createdAtField]),
      email: map[emailField]?.toString() ?? '',
      password: map[passwordField]?.toString() ?? '',
      passwordKey: map[passwordKeyField]?.toString() ?? '',
      accountStatus: AccountStatus.values.firstWhere(
        (e) =>
            e.name.toLowerCase() ==
            map[accountStatusField].toString().toLowerCase(),
        orElse: () => AccountStatus.inactive,
      ),
      userType: UserType.values.firstWhere(
        (e) => e.databaseName.toLowerCase() == userTypeValue,
        orElse: () => UserType.client,
      ),
      accessStartTime: _parseDateTime(map[accessStartTimeField]),
      accessEndTime: _parseDateTime(map[accessEndTimeField]),
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) {
      return null;
    }

    return DateTime.tryParse(value.toString());
  }
}

class ClientAccountModel {
  final String? id;
  final String credentialId;
  final DateTime? createdAt;
  final String firstName;
  final String lastName;
  final String email;
  final String? middleName;
  final DateTime? birthDate;
  final String? phoneNumber;
  final String? profilePictureUrl;

  ClientAccountModel({
    this.id,
    required this.credentialId,
    this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.middleName,
    this.birthDate,
    this.phoneNumber,
    this.profilePictureUrl,
  });

  static const String tableName = 'client_accounts';
  static const String idField = 'id';
  static const String credentialIdField = 'credential_id';
  static const String createdAtField = 'created_at';
  static const String firstNameField = 'first_name';
  static const String lastNameField = 'last_name';
  static const String emailField = 'email';
  static const String middleNameField = 'middle_name';
  static const String birthDateField = 'birth_date';
  static const String phoneNumberField = 'phone_number';
  static const String profilePictureUrlField = 'profile_picture_url';

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      idField: id,
      credentialIdField: credentialId,
      createdAtField: createdAt?.toIso8601String(),
      firstNameField: firstName,
      lastNameField: lastName,
      emailField: email,
      middleNameField: middleName,
      birthDateField: birthDate?.toIso8601String(),
      phoneNumberField: phoneNumber,
      profilePictureUrlField: profilePictureUrl,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory ClientAccountModel.fromMap(Map<String, dynamic> map) {
    return ClientAccountModel(
      id: map[idField]?.toString(),
      credentialId: map[credentialIdField]?.toString() ?? '',
      createdAt: _parseDateTime(map[createdAtField]),
      firstName: map[firstNameField]?.toString() ?? '',
      lastName: map[lastNameField]?.toString() ?? '',
      email: map[emailField]?.toString() ?? '',
      middleName: map[middleNameField]?.toString(),
      birthDate: _parseDateTime(map[birthDateField]),
      phoneNumber: map[phoneNumberField]?.toString(),
      profilePictureUrl: map[profilePictureUrlField]?.toString(),
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) {
      return null;
    }

    return DateTime.tryParse(value.toString());
  }
}

class AccountModel {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime createdAt;
  final DateTime birthDate;
  final String email;
  final String phoneNumber;
  final String? profilePictureUrl;

  AccountModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.createdAt,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    this.profilePictureUrl,
  });

  static const String idField = 'Id';
  static const String firstNameField = 'First_Name';
  static const String middleNameField = 'Middle_Name';
  static const String lastNameField = 'Last_Name';
  static const String createdAtField = 'Created_At';
  static const String birthDateField = 'Birth_Date';
  static const String emailField = 'Email';
  static const String phoneNumberField = 'Phone_Number';
  static const String profilePictureUrlField = 'Profile_Picture_Url';

  toMap() {
    return {
      idField: id,
      firstNameField: firstName,
      middleNameField: middleName,
      lastNameField: lastName,
      createdAtField: createdAt.toIso8601String(),
      birthDateField: birthDate.toIso8601String(),
      emailField: email,
      phoneNumberField: phoneNumber,
      profilePictureUrlField: profilePictureUrl,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map[idField],
      firstName: map[firstNameField],
      middleName: map[middleNameField],
      lastName: map[lastNameField],
      createdAt: DateTime.parse(map[createdAtField]),
      birthDate: DateTime.parse(map[birthDateField]),
      email: map[emailField],
      phoneNumber: map[phoneNumberField],
      profilePictureUrl: map[profilePictureUrlField],
    );
  }
}

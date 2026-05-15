class AccountEntity {
  final String accountId;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime createdAt;
  final DateTime birthDate;
  final String email;
  final String phoneNumber;
  final String? profilePictureUrl;

  AccountEntity({
    required this.accountId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.createdAt,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    this.profilePictureUrl,
  });
}

class ClientAccountEntity {
  final String id;
  final String credentialId;
  final DateTime? createdAt;
  final String firstName;
  final String lastName;
  final String email;
  final String? middleName;
  final DateTime? birthDate;
  final String? phoneNumber;
  final String? profilePictureUrl;

  ClientAccountEntity({
    required this.id,
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

  String get fullName {
    final nameParts = [firstName, middleName, lastName]
        .where((part) => part != null && part.trim().isNotEmpty)
        .map((part) => part!.trim())
        .toList();

    return nameParts.join(' ');
  }
}

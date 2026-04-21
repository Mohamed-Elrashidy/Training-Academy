/// ****************** FILE INFO ******************
/// File Name: password_hash_helper.dart
/// Purpose: Provide salted password hashing and verification utilities.
/// Author: Mohamed Elrashidy
/// Created At: 21/04/2026

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class PasswordHashHelper {
  static final Random _secureRandom = Random.secure();

  /// Function Name: generateSalt
  ///
  /// Purpose: Generates a random URL-safe salt value for password hashing.
  ///
  /// Parameters:
  /// - length: The number of random bytes to generate.
  ///
  /// Returns: String
  static String generateSalt({int length = 16}) {
    final randomBytes = List<int>.generate(
      length,
      (_) => _secureRandom.nextInt(256),
    );

    return base64Url.encode(randomBytes);
  }

  /// Function Name: hashPassword
  ///
  /// Purpose: Hashes a password with the provided salt using SHA-256.
  ///
  /// Parameters:
  /// - password: The plain text password.
  /// - salt: The salt associated with the user.
  ///
  /// Returns: String
  static String hashPassword({required String password, required String salt}) {
    final bytes = utf8.encode('$salt:$password');
    return sha256.convert(bytes).toString();
  }

  /// Function Name: verifyPassword
  ///
  /// Purpose: Verifies a password by comparing its hash to the stored hash.
  ///
  /// Parameters:
  /// - password: The password entered by the user.
  /// - salt: The stored salt for that user.
  /// - storedHash: The stored password hash from the database.
  ///
  /// Returns: bool
  static bool verifyPassword({
    required String password,
    required String salt,
    required String storedHash,
  }) {
    return hashPassword(password: password, salt: salt) == storedHash;
  }
}

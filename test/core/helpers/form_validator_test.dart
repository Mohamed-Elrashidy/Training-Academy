import 'package:flutter_test/flutter_test.dart';
import 'package:training_acedamy/core/helpers/form_validator.dart';

void main() {
  group('FormValidator.validateEmail', () {
    test('returns required error for empty value', () {
      expect(
        FormValidator.validateEmail(
          '',
          emptyMessage: 'required',
          invalidMessage: 'invalid',
        ),
        'required',
      );
    });

    test('returns invalid error for malformed email', () {
      expect(
        FormValidator.validateEmail(
          'invalid-email',
          emptyMessage: 'required',
          invalidMessage: 'invalid',
        ),
        'invalid',
      );
    });

    test('returns null for valid email', () {
      expect(
        FormValidator.validateEmail(
          'user@example.com',
          emptyMessage: 'required',
          invalidMessage: 'invalid',
        ),
        isNull,
      );
    });
  });

  group('FormValidator.validatePassword', () {
    test('returns required error for empty value', () {
      expect(
        FormValidator.validatePassword(
          '',
          emptyMessage: 'required',
          invalidMessage: 'invalid',
        ),
        'required',
      );
    });

    test('returns invalid error for weak password', () {
      expect(
        FormValidator.validatePassword(
          'password',
          emptyMessage: 'required',
          invalidMessage: 'invalid',
        ),
        'invalid',
      );
    });

    test('returns null for strong password', () {
      expect(
        FormValidator.validatePassword(
          'Password1',
          emptyMessage: 'required',
          invalidMessage: 'invalid',
        ),
        isNull,
      );
    });
  });

  group('FormValidator.validateConfirmPassword', () {
    test('returns required error for empty value', () {
      expect(
        FormValidator.validateConfirmPassword(
          '',
          emptyMessage: 'required',
          mismatchMessage: 'mismatch',
          password: 'Password1',
        ),
        'required',
      );
    });

    test('returns mismatch error for different values', () {
      expect(
        FormValidator.validateConfirmPassword(
          'Password2',
          emptyMessage: 'required',
          mismatchMessage: 'mismatch',
          password: 'Password1',
        ),
        'mismatch',
      );
    });

    test('returns null when values match', () {
      expect(
        FormValidator.validateConfirmPassword(
          'Password1',
          emptyMessage: 'required',
          mismatchMessage: 'mismatch',
          password: 'Password1',
        ),
        isNull,
      );
    });
  });
}

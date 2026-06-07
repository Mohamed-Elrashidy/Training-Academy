class FormValidator {
  static final RegExp _emailPattern = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );
  static final RegExp _uppercasePattern = RegExp(r'[A-Z]');
  static final RegExp _lowercasePattern = RegExp(r'[a-z]');
  static final RegExp _numberPattern = RegExp(r'\d');

  static String? validateRequired(
    String? value, {
    required String emptyMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return emptyMessage;
    }

    return null;
  }

  static String? validateEmail(
    String? value, {
    required String emptyMessage,
    required String invalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value,
      emptyMessage: emptyMessage,
    );
    if (requiredValidation != null) {
      return requiredValidation;
    }

    if (!_emailPattern.hasMatch(value!.trim())) {
      return invalidMessage;
    }

    return null;
  }

  static String? validatePassword(
    String? value, {
    required String emptyMessage,
    required String invalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value,
      emptyMessage: emptyMessage,
    );
    if (requiredValidation != null) {
      return requiredValidation;
    }

    if (!_isValidPassword(value!)) {
      return invalidMessage;
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value, {
    required String emptyMessage,
    required String mismatchMessage,
    required String password,
  }) {
    final requiredValidation = validateRequired(
      value,
      emptyMessage: emptyMessage,
    );
    if (requiredValidation != null) {
      return requiredValidation;
    }

    if (value != password) {
      return mismatchMessage;
    }

    return null;
  }

  static bool isPasswordValid(String value) => _isValidPassword(value);

  static bool _isValidPassword(String value) {
    return value.length >= 8 &&
        _uppercasePattern.hasMatch(value) &&
        _lowercasePattern.hasMatch(value) &&
        _numberPattern.hasMatch(value);
  }
}

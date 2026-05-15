// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get welcome => 'Welcome to our app!';

  @override
  String get login => 'Login';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get createAccount => 'Create Account';

  @override
  String get fullName => 'Full Name';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get emailAlreadyInUse => 'The email address is already in use.';

  @override
  String get invalidCredentials => 'Invalid email or password.';

  @override
  String get accountInactive => 'Your account is inactive. Please contact support.';
}

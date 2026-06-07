import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our app!'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @emailRequiredValidation.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get emailRequiredValidation;

  /// No description provided for @emailInvalidValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address.'**
  String get emailInvalidValidation;

  /// No description provided for @passwordRequiredValidation.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get passwordRequiredValidation;

  /// No description provided for @passwordInvalidValidation.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters and include uppercase, lowercase, and a number.'**
  String get passwordInvalidValidation;

  /// No description provided for @confirmPasswordRequiredValidation.
  ///
  /// In en, this message translates to:
  /// **'Confirm password is required.'**
  String get confirmPasswordRequiredValidation;

  /// No description provided for @confirmPasswordMismatchValidation.
  ///
  /// In en, this message translates to:
  /// **'Password and confirm password do not match.'**
  String get confirmPasswordMismatchValidation;

  /// No description provided for @firstNameRequiredValidation.
  ///
  /// In en, this message translates to:
  /// **'First name is required.'**
  String get firstNameRequiredValidation;

  /// No description provided for @lastNameRequiredValidation.
  ///
  /// In en, this message translates to:
  /// **'Last name is required.'**
  String get lastNameRequiredValidation;

  /// No description provided for @passwordCriteriaMinimumLength.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get passwordCriteriaMinimumLength;

  /// No description provided for @passwordCriteriaUppercase.
  ///
  /// In en, this message translates to:
  /// **'Contains an uppercase letter'**
  String get passwordCriteriaUppercase;

  /// No description provided for @passwordCriteriaLowercase.
  ///
  /// In en, this message translates to:
  /// **'Contains a lowercase letter'**
  String get passwordCriteriaLowercase;

  /// No description provided for @passwordCriteriaNumber.
  ///
  /// In en, this message translates to:
  /// **'Contains a number'**
  String get passwordCriteriaNumber;

  /// No description provided for @passwordCriteriaMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords match'**
  String get passwordCriteriaMatch;

  /// No description provided for @iAgreeToThe.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get iAgreeToThe;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @agreeToTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms and Conditions'**
  String get agreeToTermsAndConditions;

  /// No description provided for @termsAndConditionsRequiredValidation.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the Terms and Conditions.'**
  String get termsAndConditionsRequiredValidation;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The email address is already in use.'**
  String get emailAlreadyInUse;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get invalidCredentials;

  /// No description provided for @accountInactive.
  ///
  /// In en, this message translates to:
  /// **'Your account is inactive. Please contact support.'**
  String get accountInactive;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

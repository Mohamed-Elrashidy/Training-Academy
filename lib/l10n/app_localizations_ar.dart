// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get welcome => 'مرحبًا بك في تطبيقنا!';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get dontHaveAnAccount => 'ليس لديك حساب؟';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get alreadyHaveAnAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get emailAlreadyInUse => 'عنوان البريد الإلكتروني مستخدم بالفعل.';

  @override
  String get invalidCredentials => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get accountInactive => 'حسابك غير نشط. يرجى الاتصال بالدعم.';
}

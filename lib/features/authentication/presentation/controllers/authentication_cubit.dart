import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_service.dart';
import 'package:training_acedamy/features/authentication/data/repository/authentication_repository.dart';
import 'package:training_acedamy/features/authentication/data/repository/signup_repository.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_state.dart';

import '../../data/models/credential_model.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitialState());
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await CrashlyticsService.instance.log('Authentication: login attempt started');
    await CrashlyticsService.instance.setCustomKey(
      'auth_method',
      'email_password',
    );

    try {
      final result = await authenticationRemoteDataSource
          .signInWithEmailAndPassword(email: email, password: password);

      await result.fold(
        ifLeft: (error) async {
          await CrashlyticsService.instance.log(
            'Authentication: login failed with handled error ${error.code}',
          );
          emit(LoginFailureState(error));
        },
        ifRight: (credential) async {
          if (credential is CredentialModel) {
            await _setCredentialCrashlyticsContext(credential);
          }
          await CrashlyticsService.instance.log(
            'Authentication: login completed successfully',
          );
          emit(LoginSuccessState(credential));
        },
      );
    } catch (error, stackTrace) {
      await CrashlyticsService.instance.recordNonFatal(
        error,
        stackTrace,
        reason: 'Unexpected login flow failure',
        extraKeys: {
          'feature': 'authentication',
          'action': 'login_with_email_and_password',
        },
      );
      emit(
        LoginFailureState(
          ApiErrorModel(
            message: 'Something went wrong. Please try again.',
            code: 'unexpected-login-error',
          ),
        ),
      );
    }
  }

  AuthenticationRepository authenticationRemoteDataSource =
      AuthenticationRepository();
  SignupRepository signupRepository = SignupRepository();

  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
  }) async {
    final trimmedFirstName = firstName.trim();
    final trimmedLastName = lastName.trim();
    final trimmedEmail = email.trim();

    if (trimmedFirstName.isEmpty) {
      emit(
        SignupFailureState(
          ApiErrorModel(
            message: 'First name is required.',
            code: 'first-name-required',
          ),
        ),
      );
      return;
    }

    if (trimmedLastName.isEmpty) {
      emit(
        SignupFailureState(
          ApiErrorModel(
            message: 'Last name is required.',
            code: 'last-name-required',
          ),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      emit(
        SignupFailureState(
          ApiErrorModel(
            message: 'Password and confirm password do not match.',
            code: 'password-mismatch',
          ),
        ),
      );
      return;
    }

    emit(SignupLoadingState());
    await CrashlyticsService.instance.log('Authentication: signup attempt started');
    await CrashlyticsService.instance.setCustomKey(
      'auth_method',
      'email_password',
    );

    try {
      final result = await signupRepository.signupClient(
        email: trimmedEmail,
        password: password,
        firstName: trimmedFirstName,
        lastName: trimmedLastName,
      );

      await result.fold(
        ifLeft: (error) async {
          await CrashlyticsService.instance.log(
            'Authentication: signup failed with handled error ${error.code}',
          );
          emit(SignupFailureState(error));
        },
        ifRight: (signupResult) async {
          await _setCredentialCrashlyticsContext(signupResult.credential);
          await CrashlyticsService.instance.log(
            'Authentication: signup completed successfully',
          );
          emit(SignupSuccessState(signupResult));
        },
      );
    } catch (error, stackTrace) {
      await CrashlyticsService.instance.recordNonFatal(
        error,
        stackTrace,
        reason: 'Unexpected signup flow failure',
        extraKeys: {
          'feature': 'authentication',
          'action': 'signup_with_email_and_password',
        },
      );
      emit(
        SignupFailureState(
          ApiErrorModel(
            message: 'Something went wrong. Please try again.',
            code: 'unexpected-signup-error',
          ),
        ),
      );
    }
  }

  Future<void> _setCredentialCrashlyticsContext(
    CredentialModel credential,
  ) async {
    final userIdentifier = credential.id ?? credential.email;
    await CrashlyticsService.instance.setUserContext(
      userId: userIdentifier,
      accountType: credential.userType.name,
      role: credential.userType.name,
    );
    await CrashlyticsService.instance.setCustomKey(
      'account_status',
      credential.accountStatus.name,
    );
  }
}

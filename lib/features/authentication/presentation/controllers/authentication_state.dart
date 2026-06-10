import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';
import 'package:training_acedamy/features/authentication/data/models/signup_result_model.dart';

import 'package:training_acedamy/core/network/api_error_model.dart';

class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class LoginLoadingState extends AuthenticationState {}

class LoginSuccessState extends AuthenticationState {
  final CredentialModel credential;

  LoginSuccessState(this.credential);
}

class LoginFailureState extends AuthenticationState {
  final ApiErrorModel error;

  LoginFailureState(this.error);
}

class SignupLoadingState extends AuthenticationState {}

class SignupSuccessState extends AuthenticationState {
  final SignupResultModel signupResult;

  SignupSuccessState(this.signupResult);
}

class SignupFailureState extends AuthenticationState {
  final ApiErrorModel error;

  SignupFailureState(this.error);
}

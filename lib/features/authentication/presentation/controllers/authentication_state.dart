import 'package:training_acedamy/core/network/api_error_model.dart';

class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class LoginLoadingState extends AuthenticationState {}

class LoginSuccessState extends AuthenticationState {
  final dynamic data;

  LoginSuccessState(this.data);
}

class LoginFailureState extends AuthenticationState {
  final ApiErrorModel error;

  LoginFailureState(this.error);
}

class SignupLoadingState extends AuthenticationState {}

class SignupSuccessState extends AuthenticationState {
  final dynamic data;

  SignupSuccessState(this.data);
}

class SignupFailureState extends AuthenticationState {
  final ApiErrorModel error;

  SignupFailureState(this.error);
}

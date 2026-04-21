import 'package:training_acedamy/core/network/api_error_model.dart';

class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {}

class AuthenticationFailureState extends AuthenticationState {
  final ApiErrorModel error;
  AuthenticationFailureState(this.error);
}

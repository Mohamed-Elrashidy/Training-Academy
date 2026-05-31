import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/authentication/data/repository/authentication_repository.dart';
import 'package:training_acedamy/features/authentication/data/repository/signup_repository.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitialState());
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final result = await authenticationRemoteDataSource
        .signInWithEmailAndPassword(email: email, password: password);

    result.fold(
      ifLeft: (error) => emit(LoginFailureState(error)),
      ifRight: (credential) => emit(LoginSuccessState(credential)),
    );
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
    final result = await signupRepository.signupClient(
      email: trimmedEmail,
      password: password,
      firstName: trimmedFirstName,
      lastName: trimmedLastName,
    );

    result.fold(
      ifLeft: (error) => emit(SignupFailureState(error)),
      ifRight: (signupResult) => emit(SignupSuccessState(signupResult)),
    );
  }
}

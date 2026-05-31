import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/features/authentication/data/repository/authentication_repository.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_state.dart';

import '../../../../core/enums/accounts/user_type.dart';

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

  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
    required UserType userType,
    required String name,
  }) async {
    emit(SignupLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final result = await authenticationRemoteDataSource
        .signupWithEmailAndPassword(
          email: email,
          password: password,
          userType: userType,
        );

    result.fold(
      ifLeft: (error) => emit(SignupFailureState(error)),
      ifRight: (credential) => emit(SignupSuccessState(credential)),
    );
  }
}

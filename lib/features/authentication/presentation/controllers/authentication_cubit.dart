import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/features/authentication/data/repository/authentication_repository.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_state.dart';

import '../../../../core/enums/accounts/user_type.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitialState());
  loginWithEmailAndPassword({required String email, required String password}) {
    emit(AuthenticationLoadingState());
  }

  AuthenticationRepository authenticationRemoteDataSource =
      AuthenticationRepository();

  signupWithEmailAndPassword({
    required String email,
    required String password,
    required UserType userType,
    required String name,
  }) {}
}

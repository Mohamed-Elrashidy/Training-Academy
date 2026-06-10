import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/enums/accounts/user_type.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';
import 'package:training_acedamy/features/client_account/data/repository/client_account_repository.dart';
import 'package:training_acedamy/features/client_account/domain/entity/client_account_entity.dart';

part 'client_account_state.dart';

class ClientAccountCubit extends Cubit<ClientAccountState> {
  ClientAccountCubit({required this.repository})
    : super(ClientAccountInitialState());

  final ClientAccountRepository repository;

  Future<void> initializeAccount({required CredentialModel? credential}) async {
    if (credential == null || (credential.id ?? '').isEmpty) {
      emit(
        ClientAccountFailureState(
          ApiErrorModel(
            message: 'Unable to load your session. Please sign in again.',
            code: 'missing-auth-credential',
          ),
        ),
      );
      return;
    }

    if (credential.userType != UserType.client) {
      emit(
        ClientAccountFailureState(
          ApiErrorModel(
            message: 'This account does not belong to the client flow.',
            code: 'invalid-client-account-type',
          ),
        ),
      );
      return;
    }

    emit(ClientAccountLoadingState());

    final result = await repository.getClientAccount(
      credentialId: credential.id!,
    );

    result.fold(
      ifLeft: (error) => emit(ClientAccountFailureState(error)),
      ifRight: (account) => emit(
        ClientAccountSuccessState(credential: credential, account: account),
      ),
    );
  }

  ClientAccountEntity? get currentAccount {
    final currentState = state;
    if (currentState is ClientAccountSuccessState) {
      return currentState.account;
    }

    return null;
  }
}

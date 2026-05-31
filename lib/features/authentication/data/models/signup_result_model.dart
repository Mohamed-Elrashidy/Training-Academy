import 'package:training_acedamy/features/authentication/data/models/credential_model.dart';
import 'package:training_acedamy/features/shared/profiles/data/models/client_account_model.dart';

class SignupResultModel {
  final CredentialModel credential;
  final ClientAccountModel clientProfile;

  SignupResultModel({required this.credential, required this.clientProfile});

  factory SignupResultModel.fromMap(Map<String, dynamic> map) {
    return SignupResultModel(
      credential: CredentialModel.fromMap(
        Map<String, dynamic>.from(map['credential'] as Map),
      ),
      clientProfile: ClientAccountModel.fromMap(
        Map<String, dynamic>.from(map['clientProfile'] as Map),
      ),
    );
  }
}

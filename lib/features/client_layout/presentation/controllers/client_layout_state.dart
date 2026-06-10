import 'package:training_acedamy/features/client_layout/domain/enums/client_modules.dart';

class ClientLayoutState {
  final ClientModules selectedModule;

  ClientLayoutState({this.selectedModule = ClientModules.news});

  ClientLayoutState copyWith({ClientModules? selectedModule}) {
    return ClientLayoutState(
      selectedModule: selectedModule ?? this.selectedModule,
    );
  }
}

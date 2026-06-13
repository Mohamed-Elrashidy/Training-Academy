import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/client_modules.dart';
import 'client_layout_state.dart';

class ClientLayoutCubit extends Cubit<ClientLayoutState> {
  ClientLayoutCubit() : super(ClientLayoutState());

  List<ClientModules> get mobileModules => const [
    ClientModules.home,
    ClientModules.messages,
    ClientModules.programs,
    ClientModules.forms,
    ClientModules.settings,
  ];

  List<ClientModules> get tabletModules => ClientModules.values;

  void selectModule(ClientModules module) {
    emit(state.copyWith(selectedModule: module));
  }
}

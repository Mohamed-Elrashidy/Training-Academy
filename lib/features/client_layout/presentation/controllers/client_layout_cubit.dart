import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/base_classes/modules/base_modules_enum.dart';

import '../../domain/enums/client_modules.dart';
import 'client_layout_state.dart';

class ClientLayoutCubit extends Cubit<ClientLayoutState> {
  ClientLayoutCubit() : super(ClientLayoutState());

  void selectModule(BaseModulesEnum module) {
    emit(state.copyWith(selectedModule: module as ClientModules));
  }
}

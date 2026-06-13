import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/features/employee_module/domain/enums/employee_modules.dart';

import 'employee_layout_state.dart';

class EmployeeLayoutCubit extends Cubit<EmployeeLayoutState> {
  EmployeeLayoutCubit() : super(EmployeeLayoutState());

  List<EmployeeModules> get mobileModules => const [
    EmployeeModules.home,
    EmployeeModules.messages,
    EmployeeModules.programs,
    EmployeeModules.forms,
    EmployeeModules.settings,
  ];

  List<EmployeeModules> get tabletModules => EmployeeModules.values;

  void selectModule(EmployeeModules module) {
    emit(state.copyWith(selectedModule: module));
  }
}

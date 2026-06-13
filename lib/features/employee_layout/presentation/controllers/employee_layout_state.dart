import 'package:training_acedamy/features/employee_module/domain/enums/employee_modules.dart';

class EmployeeLayoutState {
  final EmployeeModules selectedModule;

  EmployeeLayoutState({this.selectedModule = EmployeeModules.home});

  EmployeeLayoutState copyWith({EmployeeModules? selectedModule}) {
    return EmployeeLayoutState(
      selectedModule: selectedModule ?? this.selectedModule,
    );
  }
}

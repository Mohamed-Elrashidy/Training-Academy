import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/employee_module/domain/enums/employee_modules.dart';

import 'employee_layout_state.dart';

class EmployeeLayoutCubit extends Cubit<EmployeeLayoutState> {
  EmployeeLayoutCubit() : super(EmployeeLayoutState());

  List<EmployeeModules> get mobileModules => const [
    EmployeeModules.home,
    EmployeeModules.messages,
    EmployeeModules.programs,
    EmployeeModules.programsManagement,
    EmployeeModules.settings,
  ];

  List<EmployeeModules> get tabletModules => EmployeeModules.values;

  void selectModule(EmployeeModules module) {
    emit(state.copyWith(selectedModule: module));
  }

  void syncSelectedModule(String location) {
    final module = moduleForLocation(location);
    if (module != state.selectedModule) {
      emit(state.copyWith(selectedModule: module));
    }
  }

  String routeForModule(EmployeeModules module) {
    switch (module) {
      case EmployeeModules.home:
        return Routes.employeeHome;
      case EmployeeModules.messages:
        return Routes.employeeMessages;
      case EmployeeModules.programs:
        return Routes.employeePrograms;
      case EmployeeModules.programsManagement:
        return Routes.employeeProgramManagement;
      case EmployeeModules.forms:
        return Routes.employeeForms;
      case EmployeeModules.news:
        return Routes.employeeNews;
      case EmployeeModules.profile:
        return Routes.employeeProfile;
      case EmployeeModules.settings:
        return Routes.employeeSettings;
    }
  }

  EmployeeModules moduleForLocation(String location) {
    if (location.startsWith(Routes.employeeProgramManagement)) {
      return EmployeeModules.programsManagement;
    }

    switch (location) {
      case Routes.employeeHome:
        return EmployeeModules.home;
      case Routes.employeeMessages:
        return EmployeeModules.messages;
      case Routes.employeePrograms:
        return EmployeeModules.programs;
      case Routes.employeeForms:
        return EmployeeModules.forms;
      case Routes.employeeNews:
        return EmployeeModules.news;
      case Routes.employeeProfile:
        return EmployeeModules.profile;
      case Routes.employeeSettings:
        return EmployeeModules.settings;
      default:
        return EmployeeModules.home;
    }
  }
}

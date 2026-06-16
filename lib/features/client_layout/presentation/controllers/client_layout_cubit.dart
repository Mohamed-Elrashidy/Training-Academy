import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/routing/routes.dart';

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

  void syncSelectedModule(String location) {
    final module = moduleForLocation(location);
    if (module != state.selectedModule) {
      emit(state.copyWith(selectedModule: module));
    }
  }

  String routeForModule(ClientModules module) {
    switch (module) {
      case ClientModules.home:
        return Routes.clientHome;
      case ClientModules.messages:
        return Routes.clientMessages;
      case ClientModules.programs:
        return Routes.clientPrograms;
      case ClientModules.forms:
        return Routes.clientForms;
      case ClientModules.news:
        return Routes.clientNews;
      case ClientModules.profile:
        return Routes.clientProfile;
      case ClientModules.settings:
        return Routes.clientSettings;
    }
  }

  ClientModules moduleForLocation(String location) {
    switch (location) {
      case Routes.clientHome:
        return ClientModules.home;
      case Routes.clientMessages:
        return ClientModules.messages;
      case Routes.clientPrograms:
        return ClientModules.programs;
      case Routes.clientForms:
        return ClientModules.forms;
      case Routes.clientNews:
        return ClientModules.news;
      case Routes.clientProfile:
        return ClientModules.profile;
      case Routes.clientSettings:
        return ClientModules.settings;
      default:
        return ClientModules.home;
    }
  }
}

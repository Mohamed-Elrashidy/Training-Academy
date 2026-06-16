import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/core/routing/auth_routing.dart';
import 'package:training_acedamy/core/routing/client_layout_routing.dart';
import 'package:training_acedamy/core/routing/employee_layout_routing.dart';
import 'package:training_acedamy/core/routing/program_management_routing.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_route_observer.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';

class Routing {
  static final GoRouter router = GoRouter(
    navigatorKey: appMainNavigatorKey,
    initialLocation: Routes.loginPage,
    observers: [CrashlyticsRouteObserver()],
    routes: <RouteBase>[
      ...AuthenticationRouter.routes(
        authenticationCubitBuilder: (BuildContext context) {
          try {
            return context.read<AuthenticationCubit>();
          } catch (e) {
            return getIt<AuthenticationCubit>();
          }
        },
      ),
      ...ClientLayoutRouter.routes(),
      ...ProgramManagementRouter.routes(),
      ...EmployeeLayoutRouting.routes(),
    ],
  );
}

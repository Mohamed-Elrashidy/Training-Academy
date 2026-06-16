import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/employee_module/domain/enums/employee_modules.dart';

import '../../features/authentication/presentation/controllers/authentication_cubit.dart';
import '../../features/employee_layout/presentation/controllers/employee_account_cubit.dart';
import '../../features/employee_layout/presentation/controllers/employee_layout_cubit.dart';
import '../../features/employee_layout/presentation/ui/pages/employee_layout_page.dart';
import 'program_management_routing.dart';
import '../coordinator/app_coordinator.dart';

class EmployeeLayoutRouting {
  static List<RouteBase> routes() {
    return [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<EmployeeLayoutCubit>(
                create: (_) => getIt<EmployeeLayoutCubit>(),
              ),
              BlocProvider<EmployeeAccountCubit>(
                create: (_) => getIt<EmployeeAccountCubit>()
                  ..initializeAccount(
                    credential: context
                        .read<AuthenticationCubit>()
                        .currentCredential,
                  ),
              ),
            ],
            child: EmployeeLayoutPage(
              location: state.matchedLocation,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            name: Routes.employeeHome,
            path: Routes.employeeHome,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.home.widget;
            },
          ),
          GoRoute(
            name: Routes.employeeMessages,
            path: Routes.employeeMessages,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.messages.widget;
            },
          ),
          GoRoute(
            name: Routes.employeePrograms,
            path: Routes.employeePrograms,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.programs.widget;
            },
          ),
          ...ProgramManagementRouter.routes(),
          GoRoute(
            name: Routes.employeeForms,
            path: Routes.employeeForms,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.forms.widget;
            },
          ),
          GoRoute(
            name: Routes.employeeNews,
            path: Routes.employeeNews,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.news.widget;
            },
          ),
          GoRoute(
            name: Routes.employeeProfile,
            path: Routes.employeeProfile,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.profile.widget;
            },
          ),
          GoRoute(
            name: Routes.employeeSettings,
            path: Routes.employeeSettings,
            builder: (BuildContext context, GoRouterState state) {
              return EmployeeModules.settings.widget;
            },
          ),
        ],
      ),
    ];
  }
}

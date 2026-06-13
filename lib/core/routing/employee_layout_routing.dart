import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';

import '../../features/authentication/presentation/controllers/authentication_cubit.dart';
import '../../features/employee_layout/presentation/controllers/employee_account_cubit.dart';
import '../../features/employee_layout/presentation/controllers/employee_layout_cubit.dart';
import '../../features/employee_layout/presentation/ui/pages/employee_layout_page.dart';
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
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: Routes.employeeHome,
            path: Routes.employeeHome,
            builder: (BuildContext context, GoRouterState state) {
              return const EmployeeLayoutPage();
            },
          ),
        ],
      ),
    ];
  }
}

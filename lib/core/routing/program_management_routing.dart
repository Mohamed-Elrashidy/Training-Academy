import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/program_management/presentation/controller/programs_management_cubit.dart';
import 'package:training_acedamy/features/program_management/presentation/ui/pages/add_program_page.dart';
import 'package:training_acedamy/features/program_management/presentation/ui/pages/program_managements_layout.dart';

class ProgramManagementRouter {
  static List<RouteBase> routes() {
    return [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BlocProvider(
            create: (_) => ProgramsManagementCubit(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: Routes.employeeProgramManagement,
            path: Routes.employeeProgramManagement,
            builder: (BuildContext context, GoRouterState state) {
              return const ProgramManagementsLayout();
            },
            routes: [
              GoRoute(
                name: Routes.addProgramPage,
                path: 'add',
                builder: (BuildContext context, GoRouterState state) {
                  return const AddProgramPage();
                },
              ),
            ],
          ),
        ],
      ),
    ];
  }
}

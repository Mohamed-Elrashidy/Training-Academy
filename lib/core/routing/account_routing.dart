import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/client_layout/presentation/ui/pages/client_layout_page.dart';
import 'package:training_acedamy/features/employee_layout/presentation/ui/pages/employee_layout_page.dart';

class AccountRouter {
  static List<RouteBase> routes() {
    return [
      GoRoute(
        name: Routes.employeeHome,
        path: Routes.employeeHome,
        builder: (BuildContext context, GoRouterState state) {
          return const EmployeeLayoutPage();
        },
      ),
      GoRoute(
        name: Routes.clientHome,
        path: Routes.clientHome,
        builder: (BuildContext context, GoRouterState state) {
          return const ClientLayoutPage();
        },
      ),
    ];
  }
}

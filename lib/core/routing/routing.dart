import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';

import '../../features/authentication/presentation/ui/pages/login_page.dart';

class Routing {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loginPage,
    routes: <RouteBase>[...authenticationRouter],
  );

  static final List<GoRoute> authenticationRouter = [
    GoRoute(
      path: Routes.loginPage,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
  ];
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/authentication/presentation/ui/pages/login_page.dart';

import '../../features/authentication/presentation/controllers/authentication_cubit.dart';
import '../../features/authentication/presentation/ui/pages/signup_page.dart';

class AuthenticationRouter {
  static List<RouteBase> routes({
    required AuthenticationCubit Function(BuildContext context)
    authenticationCubitBuilder,
  }) {
    return [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BlocProvider.value(
            value: authenticationCubitBuilder.call(context),
            child: child,
          );
        },

        routes: [
          GoRoute(
            name: Routes.loginPage,
            path: Routes.loginPage,
            builder: (BuildContext context, GoRouterState state) {
              return LoginPage();
            },
          ),
          GoRoute(
            name: Routes.signupPage,
            path: Routes.signupPage,
            builder: (BuildContext context, GoRouterState state) {
              return SignupPage();
            },
          ),
        ],
      ),
    ];
  }
}

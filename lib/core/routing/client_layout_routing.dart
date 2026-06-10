import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';
import 'package:training_acedamy/features/client_account/presentation/controllers/client_account_cubit.dart';
import 'package:training_acedamy/features/client_layout/presentation/ui/pages/client_layout_page.dart';

import '../../features/client_layout/presentation/controllers/client_layout_cubit.dart';

class ClientLayoutRouter {
  static List<RouteBase> routes() {
    return [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ClientLayoutCubit()),
              BlocProvider<ClientAccountCubit>(
                create: (_) => getIt<ClientAccountCubit>()
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
            name: Routes.clientHome,
            path: Routes.clientHome,
            builder: (BuildContext context, GoRouterState state) {
              return const ClientLayoutPage();
            },
          ),
        ],
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/core/routing/routes.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';
import 'package:training_acedamy/features/client_account/presentation/controllers/client_account_cubit.dart';
import 'package:training_acedamy/features/client_layout/presentation/ui/pages/client_layout_page.dart';

import '../../features/client_layout/domain/enums/client_modules.dart';
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
            child: ClientLayoutPage(
              location: state.matchedLocation,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            name: Routes.clientHome,
            path: Routes.clientHome,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.home.widget;
            },
          ),
          GoRoute(
            name: Routes.clientMessages,
            path: Routes.clientMessages,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.messages.widget;
            },
          ),
          GoRoute(
            name: Routes.clientPrograms,
            path: Routes.clientPrograms,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.programs.widget;
            },
          ),
          GoRoute(
            name: Routes.clientForms,
            path: Routes.clientForms,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.forms.widget;
            },
          ),
          GoRoute(
            name: Routes.clientNews,
            path: Routes.clientNews,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.news.widget;
            },
          ),
          GoRoute(
            name: Routes.clientProfile,
            path: Routes.clientProfile,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.profile.widget;
            },
          ),
          GoRoute(
            name: Routes.clientSettings,
            path: Routes.clientSettings,
            builder: (BuildContext context, GoRouterState state) {
              return ClientModules.settings.widget;
            },
          ),
        ],
      ),
    ];
  }
}

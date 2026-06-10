/// ****************** FILE INFO ******************
/// File Name: training_academy_app.dart
/// Author: Mohamed Elrashidy
/// Created At: 15/01/2026

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';

import 'core/routing/routing.dart';
import 'core/theme/theme_cubit.dart';
import 'l10n/app_localizations.dart';

GlobalKey<NavigatorState> appMainNavigatorKey = GlobalKey<NavigatorState>();

class TrainingAcademyApp extends StatelessWidget {
  TrainingAcademyApp({super.key});

  initState() {
    appMainNavigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = getIt<ThemeCubit>();
    final authenticationCubit = getIt<AuthenticationCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),
        BlocProvider.value(value: authenticationCubit),
      ],
      child: LayoutBuilder(
        builder: (_, __) => MaterialApp.router(
          key: appMainNavigatorKey,
          title: 'Training Academy',
          locale: themeCubit.state.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(useMaterial3: true, hoverColor: Colors.transparent),
          routerConfig: Routing.router,
        ),
      ),
    );
  }
}

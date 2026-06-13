import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:training_acedamy/core/coordinator/app_coordinator.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';

import 'core/routing/routing.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/theme_state.dart';
import 'l10n/app_localizations.dart';

class TrainingAcademyApp extends StatelessWidget {
  const TrainingAcademyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = getIt<ThemeCubit>();
    final authenticationCubit = getIt<AuthenticationCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),
        BlocProvider.value(value: authenticationCubit),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (_, state) {
          return MaterialApp.router(
            key: UniqueKey(),
            title: 'Training Academy',
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              hoverColor: Colors.transparent,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              hoverColor: Colors.transparent,
            ),
            routerConfig: Routing.router,
          );
        },
      ),
    );
  }
}

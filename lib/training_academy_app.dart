/// ****************** FILE INFO ******************
/// File Name: training_academy_app.dart
/// Author: Mohamed Elrashidy
/// Created At: 15/01/2026

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routing/routing.dart';
import 'core/theme/theme_cubit.dart';
import 'l10n/app_localizations.dart';

GlobalKey<NavigatorState> appMainNavigatorKey = GlobalKey<NavigatorState>();

class TrainingAcademyApp extends StatelessWidget {
  TrainingAcademyApp({super.key});
  ThemeCubit themeCubit = ThemeCubit()..loadTheme();
  initState() {
    appMainNavigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => themeCubit)],
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

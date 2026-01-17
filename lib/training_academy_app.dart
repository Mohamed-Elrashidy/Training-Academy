/// ****************** FILE INFO ******************
/// File Name: training_academy_app.dart
/// Author: Mohamed Elrashidy
/// Created At: 15/01/2026

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme_cubit.dart';
import 'features/authentication/presentation/ui/pages/login_page.dart';

GlobalKey<NavigatorState> appMainNavigatorKey = GlobalKey<NavigatorState>();

class TrainingAcademyApp extends StatelessWidget {
  const TrainingAcademyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit()..loadTheme())],
      child: LayoutBuilder(
        builder: (_, __) => MaterialApp(
          navigatorKey: appMainNavigatorKey,
          title: 'Training Academy',
          theme: ThemeData(useMaterial3: true, hoverColor: Colors.transparent),
          home: LoginPage(),
        ),
      ),
    );
  }
}

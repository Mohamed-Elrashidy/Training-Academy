import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';
import 'package:training_acedamy/training_academy_app.dart';

class CustomColorEntity {
  Color lightColor;
  Color darkColor;
  CustomColorEntity({required this.lightColor, required this.darkColor});
  Color get color =>
      appMainNavigatorKey.currentContext!.read<ThemeCubit>().state.isDarkMode
      ? darkColor
      : lightColor;
}

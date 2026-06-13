import 'dart:ui';

import 'package:training_acedamy/core/theme/theme_cubit.dart';

class CustomColorEntity {
  Color lightColor;
  Color darkColor;
  CustomColorEntity({required this.lightColor, required this.darkColor});
  Color get color => ThemeCubit.isDarkMode ? darkColor : lightColor;
}

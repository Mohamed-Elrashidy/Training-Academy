import 'package:training_acedamy/core/theme/theme_cubit.dart';

class SvgImageModel {
  String lightImage;
  String darkImage;

  SvgImageModel({required this.lightImage, required this.darkImage});

  String get image => ThemeCubit.isDarkMode ? darkImage : lightImage;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';
import 'package:training_acedamy/training_academy_app.dart';

class SvgImageModel {
  String lightImage;
  String darkImage;

  SvgImageModel({required this.lightImage, required this.darkImage});

  String get image =>
      appMainNavigatorKey.currentContext!.read<ThemeCubit>().state.isDarkMode
      ? darkImage
      : lightImage;
}

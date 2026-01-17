import 'package:training_acedamy/core/theme/app_colors.dart';
import 'package:training_acedamy/core/theme/custom_color_entity.dart';

class AppCustomColor {
  static CustomColorEntity get primaryColor => CustomColorEntity(
    lightColor: AppColors.primaryColor,
    darkColor: AppColors.primaryColor,
  );

  static CustomColorEntity get blackFont => CustomColorEntity(
    lightColor: AppColors.blackColor,
    darkColor: AppColors.whiteColor,
  );
}

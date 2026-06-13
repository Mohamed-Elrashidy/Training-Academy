import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:training_acedamy/core/base_classes/modules/base_modules_enum.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/app_custom_svg.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../theme/text_styles.dart';

class CustomDrawer<T extends BaseModulesEnum> extends StatelessWidget {
  const CustomDrawer({
    required this.modules,
    required this.selectedModule,
    required this.onSelectModule,
    super.key,
  });

  final List<T> modules;
  final T selectedModule;
  final ValueChanged<T> onSelectModule;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 80.sp,
      color: AppCustomColor.mainContainerColor.color,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(AppCustomSvg.logo.image),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 16.sp,
                children: [
                  ...modules.map(
                    (module) => GestureDetector(
                      onTap: () => onSelectModule(module),
                      child: Column(
                        children: [
                          Icon(
                            module.icon,
                            size: 20.sp,
                            color: (_isSelected(module))
                                ? AppCustomColor.primaryColor.color
                                : AppCustomColor.hintTextColor.color,
                          ),
                          Text(
                            module.title(context),
                            style: AppTextStyles.hint.copyWith(
                              color: (_isSelected(module))
                                  ? AppCustomColor.primaryColor.color
                                  : AppCustomColor.hintTextColor.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          GestureDetector(
            child: Column(
              children: [
                Icon(
                  Icons.logout,
                  size: 20.sp,
                  color: AppCustomColor.hintTextColor.color,
                ),
                Text(
                  AppLocalizations.of(context)!.logout,
                  style: AppTextStyles.hint,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  bool _isSelected(T module) {
    return module == selectedModule;
  }
}

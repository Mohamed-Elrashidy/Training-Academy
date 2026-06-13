import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/base_classes/modules/base_modules_enum.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';

class CustomBottomNavigationBar<T extends BaseModulesEnum>
    extends StatelessWidget {
  const CustomBottomNavigationBar({
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
    return SafeArea(
      top: false,
      child: Container(
        margin: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 12.sp),
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        decoration: BoxDecoration(
          color: AppCustomColor.mainContainerColor.color,
          borderRadius: BorderRadius.circular(16.sp),
          /*       boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],*/
        ),
        child: Row(
          children: modules
              .map(
                (module) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onSelectModule(module),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.sp,
                        horizontal: 4.sp,
                      ),
                      decoration: BoxDecoration(
                        color: _isSelected(module)
                            ? AppCustomColor.primaryColor.color.withAlpha(31)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            module.icon,
                            size: 20.sp,
                            color: _isSelected(module)
                                ? AppCustomColor.primaryColor.color
                                : AppCustomColor.hintTextColor.color,
                          ),
                          SizedBox(height: 4.sp),
                          Text(
                            module.title(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.caption.copyWith(
                              fontWeight: _isSelected(module)
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: _isSelected(module)
                                  ? AppCustomColor.primaryColor.color
                                  : AppCustomColor.hintTextColor.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  bool _isSelected(T module) {
    return module == selectedModule;
  }
}

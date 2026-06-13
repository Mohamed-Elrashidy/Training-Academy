import 'package:flutter/material.dart';

import '../../../../../core/extensions/extension.dart';
import '../widgets/app_controllers_widget.dart';

class SettingsPageDesktop extends StatelessWidget {
  const SettingsPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.sp,
      children: [
        Container(
          width: 300.sp,
          child: Column(spacing: 16.sp, children: [AppControllersWidget()]),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}

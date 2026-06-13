import 'package:flutter/material.dart';

import '../../../../../core/extensions/extension.dart';
import '../widgets/app_controllers_widget.dart';

class SettingsPageMobile extends StatelessWidget {
  const SettingsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 16.sp, children: [AppControllersWidget()]);
  }
}

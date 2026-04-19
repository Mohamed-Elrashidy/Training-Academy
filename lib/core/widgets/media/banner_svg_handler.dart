import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_size_checkpoints.dart';

class BannerSvgHandler extends StatelessWidget {
  const BannerSvgHandler({required this.svgPath, super.key});
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: 300 * AppSizeCheckpointsManager.fontSizeMultiplier(),
      width: double.infinity,
    );
  }
}

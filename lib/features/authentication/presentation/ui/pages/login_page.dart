import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/widgets/custom_scaffold.dart';
import 'package:training_acedamy/core/widgets/custom_text_field_with_title.dart';
import 'package:training_acedamy/core/widgets/media/banner_svg_handler.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomScaffold(
      body: Column(
        children: [
          BannerSvgHandler(
            svgPath: "assets/authentication_assets/svg_images/login_image.svg",
          ),
          Text(l10n.welcome),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: context.verticalComponentItemsSpacing,
            children: [
              CustomTextFieldWithTitle(
                title: l10n.email,
                controller: emailController,
              ),
              CustomTextFieldWithTitle(
                title: l10n.password,
                controller: passwordController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

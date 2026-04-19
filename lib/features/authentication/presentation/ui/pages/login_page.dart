import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/custom_scaffold.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field.dart';
import 'package:training_acedamy/core/widgets/media/banner_svg_handler.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../../../core/widgets/buttons/custom_text_button.dart';
import '../../../../../core/widgets/spacers/vertical_spacer.dart';

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              SizedBox(
                width: context.isMobile ? null : 500.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BannerSvgHandler(
                      svgPath:
                          "assets/authentication_assets/svg_images/login_image.svg",
                    ),
                    Text(l10n.welcome, style: AppTextStyles.titleLarge),
                    VerticalSpacer(height: 31),
                    CustomTextField(
                      controller: emailController,
                      hintText: l10n.email,
                    ),
                    VerticalSpacer(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      hintText: l10n.password,
                    ),
                    VerticalSpacer(height: 16),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        l10n.forgotPassword,
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                    VerticalSpacer(height: 31),
                    CustomTextButton(width: 150.sp, buttonText: l10n.login),
                    VerticalSpacer(height: 16),
                    RichText(
                      text: TextSpan(
                        text: l10n.dontHaveAnAccount + " ",
                        style: AppTextStyles.bodySmall,
                        children: [
                          TextSpan(
                            text: l10n.signUp,
                            style: AppTextStyles.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/helpers/dialogs/dialog_helper.dart';
import 'package:training_acedamy/core/helpers/validators/form_validator.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/buttons/custom_text_button.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field.dart';
import 'package:training_acedamy/core/widgets/loading/custom_loading_indicator.dart';
import 'package:training_acedamy/core/widgets/media/banner_svg_handler.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_state.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/spacers/vertical_spacer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _hasSubmitted = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    setState(() {
      _hasSubmitted = true;
    });

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<AuthenticationCubit>().loginWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomScaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listenWhen: (_, state) =>
            state is LoginFailureState || state is LoginSuccessState,
        listener: (context, state) {
          if (state is LoginFailureState) {
            DialogHelper.showErrorDialog(
              context: context,
              description: state.error.message,
            );
          }

          if (state is LoginSuccessState) {
            context.go(state.credential.userType.route);
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoadingState;

          return Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(),
                      SizedBox(
                        width: context.isMobile ? null : 500.sp,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BannerSvgHandler(
                                svgPath:
                                    "assets/authentication_assets/svg_images/login_image.svg",
                              ),
                              Text(
                                l10n.welcome,
                                style: AppTextStyles.titleLarge,
                              ),
                              VerticalSpacer(height: 31),
                              CustomTextField(
                                controller: emailController,
                                hintText: l10n.email,
                                autovalidateMode: _hasSubmitted
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                validator: (value) =>
                                    FormValidator.validateEmail(
                                      value,
                                      emptyMessage:
                                          l10n.emailRequiredValidation,
                                      invalidMessage:
                                          l10n.emailInvalidValidation,
                                    ),
                              ),
                              VerticalSpacer(height: 16),
                              CustomTextField(
                                controller: passwordController,
                                hintText: l10n.password,
                                isPassword: true,
                                autovalidateMode: _hasSubmitted
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                validator: (value) =>
                                    FormValidator.validatePassword(
                                      value,
                                      emptyMessage:
                                          l10n.passwordRequiredValidation,
                                      invalidMessage:
                                          l10n.passwordInvalidValidation,
                                    ),
                              ),
                              VerticalSpacer(height: 16),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  l10n.forgotPassword,
                                  style: AppTextStyles.labelSmall,
                                ),
                              ),
                              VerticalSpacer(height: 31),
                              CustomTextButton(
                                width: 150.sp,
                                buttonText: l10n.login,
                                isEnabled: !isLoading,
                                onTap: _submitLogin,
                              ),
                              VerticalSpacer(height: 16),
                              RichText(
                                text: TextSpan(
                                  text: '${l10n.dontHaveAnAccount} ',
                                  style: AppTextStyles.bodySmall,
                                  children: [
                                    TextSpan(
                                      text: l10n.signUp,
                                      style: AppTextStyles.labelSmall,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            context.push(Routes.signupPage),
                                    ),
                                  ],
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
              if (isLoading)
                const Positioned.fill(child: CustomLoadingIndicator()),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/helpers/dialog_helper.dart';
import 'package:training_acedamy/core/helpers/form_validator.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_state.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/extensions/extension.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/app_bars/custom_app_bar.dart';
import '../../../../../core/widgets/buttons/custom_text_button.dart';
import '../../../../../core/widgets/fields/custom_text_field.dart';
import '../../../../../core/widgets/loading/custom_loading_indicator.dart';
import '../../../../../core/widgets/media/banner_svg_handler.dart';
import '../../../../../core/widgets/spacers/vertical_spacer.dart';
import '../widgets/password_criteria_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _hasSubmitted = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitSignup() {
    setState(() {
      _hasSubmitted = true;
    });

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<AuthenticationCubit>().signupWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomScaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listenWhen: (_, state) =>
            state is SignupFailureState || state is SignupSuccessState,
        listener: (context, state) {
          if (state is SignupFailureState) {
            DialogHelper.showErrorDialog(
              context: context,
              description: state.error.message,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is SignupLoadingState;

          return Stack(
            children: [
              Column(
                children: [
                  CustomAppBar(title: AppLocalizations.of(context)!.signUp),
                  Expanded(
                    child: Center(
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
                                    VerticalSpacer(height: 16),
                                    Text(
                                      l10n.createAccount,
                                      style: AppTextStyles.titleLarge,
                                    ),
                                    VerticalSpacer(height: 32),
                                    CustomTextField(
                                      controller: firstNameController,
                                      hintText: l10n.firstName,
                                      autovalidateMode: _hasSubmitted
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      validator: (value) =>
                                          FormValidator.validateRequired(
                                            value,
                                            emptyMessage: l10n
                                                .firstNameRequiredValidation,
                                          ),
                                    ),
                                    VerticalSpacer(height: 16),
                                    CustomTextField(
                                      controller: lastNameController,
                                      hintText: l10n.lastName,
                                      autovalidateMode: _hasSubmitted
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      validator: (value) =>
                                          FormValidator.validateRequired(
                                            value,
                                            emptyMessage:
                                                l10n.lastNameRequiredValidation,
                                          ),
                                    ),
                                    VerticalSpacer(height: 16),
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
                                    CustomTextField(
                                      controller: confirmPasswordController,
                                      hintText: l10n.confirmPassword,
                                      isPassword: true,
                                      autovalidateMode: _hasSubmitted
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      validator: (value) =>
                                          FormValidator.validateConfirmPassword(
                                            value,
                                            emptyMessage: l10n
                                                .confirmPasswordRequiredValidation,
                                            mismatchMessage: l10n
                                                .confirmPasswordMismatchValidation,
                                            password: passwordController.text,
                                          ),
                                    ),
                                    VerticalSpacer(height: 16),
                                    PasswordCriteriaWidget(
                                      passwordController: passwordController,
                                      confirmPasswordController:
                                          confirmPasswordController,
                                    ),

                                    VerticalSpacer(height: 31),
                                    CustomTextButton(
                                      width: 150.sp,
                                      buttonText: l10n.signUp,
                                      isEnabled: !isLoading,
                                      onTap: _submitSignup,
                                    ),
                                    VerticalSpacer(height: 16),
                                    RichText(
                                      text: TextSpan(
                                        text: '${l10n.alreadyHaveAnAccount} ',
                                        style: AppTextStyles.bodySmall,
                                        children: [
                                          TextSpan(
                                            text: l10n.login,
                                            style: AppTextStyles.labelSmall,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () =>
                                                  Navigator.of(context).pop(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpacer(height: 16),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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

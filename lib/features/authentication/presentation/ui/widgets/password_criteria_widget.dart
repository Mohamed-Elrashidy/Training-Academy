import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/check_box/custom_check_box.dart';
import 'package:training_acedamy/core/widgets/spacers/horizontal_spacer.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

class PasswordCriteriaWidget extends StatefulWidget {
  const PasswordCriteriaWidget({
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<PasswordCriteriaWidget> createState() => _PasswordCriteriaWidgetState();
}

class _PasswordCriteriaWidgetState extends State<PasswordCriteriaWidget> {
  static final RegExp _uppercasePattern = RegExp(r'[A-Z]');
  static final RegExp _lowercasePattern = RegExp(r'[a-z]');
  static final RegExp _numberPattern = RegExp(r'\d');

  bool _hasMinimumLength = false;
  bool _hasUppercaseLetter = false;
  bool _hasLowercaseLetter = false;
  bool _hasNumber = false;
  bool _passwordsMatch = false;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_handleTextChanged);
    widget.confirmPasswordController.addListener(_handleTextChanged);
    _syncCriteria();
  }

  @override
  void didUpdateWidget(covariant PasswordCriteriaWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.passwordController != widget.passwordController) {
      oldWidget.passwordController.removeListener(_handleTextChanged);
      widget.passwordController.addListener(_handleTextChanged);
    }

    if (oldWidget.confirmPasswordController !=
        widget.confirmPasswordController) {
      oldWidget.confirmPasswordController.removeListener(_handleTextChanged);
      widget.confirmPasswordController.addListener(_handleTextChanged);
    }

    _syncCriteria();
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_handleTextChanged);
    widget.confirmPasswordController.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    if (!mounted) {
      return;
    }

    setState(_syncCriteria);
  }

  void _syncCriteria() {
    final password = widget.passwordController.text;
    final confirmPassword = widget.confirmPasswordController.text;

    _hasMinimumLength = password.length >= 8;
    _hasUppercaseLetter = _uppercasePattern.hasMatch(password);
    _hasLowercaseLetter = _lowercasePattern.hasMatch(password);
    _hasNumber = _numberPattern.hasMatch(password);
    _passwordsMatch =
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PasswordCriteriaRow(
          isSelected: _hasMinimumLength,
          text: l10n.passwordCriteriaMinimumLength,
        ),
        VerticalSpacer(height: 8),
        _PasswordCriteriaRow(
          isSelected: _hasUppercaseLetter,
          text: l10n.passwordCriteriaUppercase,
        ),
        VerticalSpacer(height: 8),
        _PasswordCriteriaRow(
          isSelected: _hasLowercaseLetter,
          text: l10n.passwordCriteriaLowercase,
        ),
        VerticalSpacer(height: 8),
        _PasswordCriteriaRow(
          isSelected: _hasNumber,
          text: l10n.passwordCriteriaNumber,
        ),
        VerticalSpacer(height: 8),
        _PasswordCriteriaRow(
          isSelected: _passwordsMatch,
          text: l10n.passwordCriteriaMatch,
        ),
      ],
    );
  }
}

class _PasswordCriteriaRow extends StatelessWidget {
  const _PasswordCriteriaRow({required this.isSelected, required this.text});

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckBox(size: 14, isSelected: isSelected),
        HorizontalSpacer(width: 4),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}

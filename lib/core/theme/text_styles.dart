/// ****************** FILE INFO ******************
/// File Name: text_styles.dart
/// Purpose: Provide app-wide TextStyle helpers and a full copyWith extension
/// Author: Mohamed Elrashidy
/// Created At: 16/01/2026

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/theme/app_colors.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';
import 'package:training_acedamy/core/theme/app_size_checkpoints.dart';

class AppTextStyles {
  /// Function Name: _mainTextStyle
  ///
  /// Purpose: Base TextStyle used by the app styles.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get _mainTextStyle => const TextStyle();

  /// Function Name: displayLarge
  ///
  /// Purpose: Very large display text for splash screens or hero sections.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get displayLarge => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 48,
    fontWeight: FontWeight.w800,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: displayMedium
  ///
  /// Purpose: Large display text for prominent headings.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get displayMedium => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 40,
    fontWeight: FontWeight.w800,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: displaySmall
  ///
  /// Purpose: Slightly smaller display text.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get displaySmall => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 34,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: headlineLarge
  ///
  /// Purpose: Headline style (large) for page headings.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get headlineLarge => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 32,
    fontWeight: FontWeight.bold,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: headlineMedium
  ///
  /// Purpose: Headline style (medium) for section headings.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get headlineMedium => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 24,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: headlineSmall
  ///
  /// Purpose: Headline style (small) for subsection headings.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get headlineSmall => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 20,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: titleLarge
  ///
  /// Purpose: Large title text, typically used for dialogs or cards.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get titleLarge => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 18,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: titleMedium
  ///
  /// Purpose: Medium title text.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get titleMedium => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 16,
    fontWeight: FontWeight.w600,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: titleSmall
  ///
  /// Purpose: Small title text.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get titleSmall => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 15,
    fontWeight: FontWeight.w500,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: labelLarge
  ///
  /// Purpose: Large label text, used for prominent buttons or badges.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get labelLarge => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: labelMedium
  ///
  /// Purpose: Medium label text, used for standard buttons.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get labelMedium => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w600,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: labelSmall
  ///
  /// Purpose: Small label text for helper buttons or chips.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get labelSmall => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
    fontWeight: FontWeight.w600,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: small
  ///
  /// Purpose: Small caption-like text used for less-important UI labels.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get small => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: caption
  ///
  /// Purpose: Tiny caption used under images or for meta information.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get caption => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 11,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color.withAlpha(179),
  );

  /// Function Name: overline
  ///
  /// Purpose: Very small uppercase text usually displayed above headlines.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get overline => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
    color: AppCustomColor.blackFont.color.withAlpha(204),
  );

  /// Function Name: bodySmall
  ///
  /// Purpose: Slightly smaller body text for dense layouts.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get bodySmall => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 13,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: body
  ///
  /// Purpose: Default body text for general content.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get body => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: bodyLarge
  ///
  /// Purpose: Larger body text for emphasis or accessibility.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get bodyLarge => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 16,
    fontWeight: FontWeight.w500,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: subtitle
  ///
  /// Purpose: Secondary heading used for section titles.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get subtitle => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 16,
    fontWeight: FontWeight.w600,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: subtitle2
  ///
  /// Purpose: Slightly smaller subtitle for compact sections.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get subtitle2 => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 15,
    fontWeight: FontWeight.w500,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: title
  ///
  /// Purpose: Title style that emphasizes the app's primary color.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get title => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 18,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: button
  ///
  /// Purpose: Text style for buttons.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get button => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w600,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: heading1
  ///
  /// Purpose: Largest heading style used across the app.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get heading1 => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 32,
    fontWeight: FontWeight.bold,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: heading2
  ///
  /// Purpose: Secondary heading smaller than heading1.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get heading2 => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 24,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: heading3
  ///
  /// Purpose: Tertiary heading for card titles and sub-sections.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get heading3 => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 20,
    fontWeight: FontWeight.w700,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: paragraph
  ///
  /// Purpose: Standard paragraph text (alias for body) with slightly increased line height.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get paragraph => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color,
    height: 1.6,
  );

  /// Function Name: link
  ///
  /// Purpose: Text style for inline links.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get link => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w500,
    color: AppColors.accentColor,
    decoration: TextDecoration.underline,
  );

  /// Function Name: hint
  ///
  /// Purpose: Muted hint text used for helper labels.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get hint => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.hintTextColor.color,
  );

  /// Function Name: disabled
  ///
  /// Purpose: Disabled state text style.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get disabled => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color.withAlpha(120),
  );

  /// Function Name: error
  ///
  /// Purpose: Error message text style.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get error => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 13,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor,
  );

  /// Function Name: success
  ///
  /// Purpose: Success message text style.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get success => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 13,
    fontWeight: FontWeight.w500,
    color: AppColors.accentColor,
  );

  /// Function Name: info
  ///
  /// Purpose: Informational text style.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get info => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 13,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  /// Function Name: inputLabel
  ///
  /// Purpose: Label for input fields.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get inputLabel => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 14.25,
    fontWeight: FontWeight.w500,
    color: AppCustomColor.blackFont.color,
  );

  /// Function Name: inputHint
  ///
  /// Purpose: Hint text inside input fields.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get inputHint => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 11,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color.withAlpha(130),
  );

  /// Function Name: inputError
  ///
  /// Purpose: Small error text shown below inputs.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get inputError => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor,
  );

  /// Function Name: chip
  ///
  /// Purpose: Text used inside chips.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get chip => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
    fontWeight: FontWeight.w600,
    color: AppCustomColor.primaryColor.color,
  );

  /// Function Name: tooltip
  ///
  /// Purpose: Tooltip text (small, high-contrast on dark background).
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get tooltip => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  /// Function Name: code
  ///
  /// Purpose: Monospace style used for inline code snippets.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get code => _mainTextStyle.copyWith(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'monospace',
    backgroundColor: AppColors.backgroundColor,
    color: AppCustomColor.blackFont.color,
  );
}

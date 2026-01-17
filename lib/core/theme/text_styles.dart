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
  static TextStyle get headlineLarge => heading1;

  /// Function Name: headlineMedium
  ///
  /// Purpose: Headline style (medium) for section headings.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get headlineMedium => heading2;

  /// Function Name: headlineSmall
  ///
  /// Purpose: Headline style (small) for subsection headings.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get headlineSmall => heading3;

  /// Function Name: titleLarge
  ///
  /// Purpose: Large title text, typically used for dialogs or cards.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get titleLarge => title;

  /// Function Name: titleMedium
  ///
  /// Purpose: Medium title text.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get titleMedium => subtitle;

  /// Function Name: titleSmall
  ///
  /// Purpose: Small title text.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get titleSmall => subtitle2;

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
  static TextStyle get labelMedium => button;

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
  static TextStyle get paragraph => body.copyWithAll(height: 1.6);

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
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 13,
    fontWeight: FontWeight.w400,
    color: AppCustomColor.blackFont.color.withAlpha(150),
  );

  /// Function Name: disabled
  ///
  /// Purpose: Disabled state text style.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get disabled =>
      body.copyWithAll(color: AppCustomColor.blackFont.color.withAlpha(120));

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
  static TextStyle get inputLabel =>
      subtitle2.copyWithAll(fontSize: subtitle2.fontSize! * 0.95);

  /// Function Name: inputHint
  ///
  /// Purpose: Hint text inside input fields.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get inputHint =>
      caption.copyWithAll(color: AppCustomColor.blackFont.color.withAlpha(130));

  /// Function Name: inputError
  ///
  /// Purpose: Small error text shown below inputs.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get inputError => error.copyWithAll(
    fontSize: AppSizeCheckpointsManager.fontSizeMultiplier() * 12,
  );

  /// Function Name: chip
  ///
  /// Purpose: Text used inside chips.
  ///
  /// Parameters:
  /// - none
  ///
  /// Returns: TextStyle
  static TextStyle get chip =>
      labelSmall.copyWithAll(fontWeight: FontWeight.w600);

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

/// Function Name: copyWithAll (extension)
///
/// Purpose: Provide a full-featured copy method for TextStyle that exposes
/// all common fields. Named `copyWithAll` to avoid shadowing the built-in
/// `TextStyle.copyWith` and to ensure callers can opt into this explicit API.
///
/// Parameters:
/// - inherit: whether the style should inherit from parent text styles.
/// - color: text color.
/// - backgroundColor: background color behind the text.
/// - fontSize: font size.
/// - fontWeight: font weight.
/// - fontStyle: italic or normal.
/// - letterSpacing: spacing between letters.
/// - wordSpacing: spacing between words.
/// - textBaseline: baseline behavior.
/// - height: line height multiplier.
/// - locale: locale for the text.
/// - foreground: paint used as the text color (overrides color).
/// - background: paint used as the text background (overrides backgroundColor).
/// - shadows: list of shadows.
/// - fontFeatures: font features like numeric settings.
/// - decoration: decoration such as underline/lineThrough.
/// - decorationColor: color of the decoration.
/// - decorationStyle: style of decoration.
/// - decorationThickness: thickness of decoration.
/// - debugLabel: debug label for the style.
/// - fontFamily: font family name.
/// - fontFamilyFallback: fallback font families.
/// - package: the package where the font asset lives.
/// - overflow: how to handle overflow for text glyphs.
///
/// Returns: TextStyle
extension TextStyleCopyWithExt on TextStyle {
  TextStyle copyWithAll({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      inherit: inherit ?? this.inherit,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      debugLabel: debugLabel ?? this.debugLabel,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      // TextStyle doesn't expose a `package` getter, so we can't preserve
      // an existing value — pass the provided parameter directly.
      package: package,
      overflow: overflow ?? this.overflow,
    );
  }
}

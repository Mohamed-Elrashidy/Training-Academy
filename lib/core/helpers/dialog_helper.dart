import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/dialogs/custom_dialog.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

abstract class DialogHelper {
  static Future<T?> showMessageDialog<T>({
    required BuildContext context,
    required String title,
    required String description,
    String? submitButtonText,
    String? cancelButtonText,
    VoidCallback? onSubmit,
    VoidCallback? onCancel,
    bool showActionButtons = true,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => CustomDialog(
        title: title,
        description: description,
        submitButtonText: submitButtonText,
        cancelButtonText: cancelButtonText,
        onSubmit: onSubmit,
        onCancel: onCancel,
        showActionButtons: showActionButtons,
      ),
    );
  }

  static Future<T?> showErrorDialog<T>({
    required BuildContext context,
    required String description,
    VoidCallback? onSubmit,
    VoidCallback? onCancel,
    bool showActionButtons = true,
    bool barrierDismissible = true,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return showMessageDialog<T>(
      context: context,
      title: l10n.errorTitle,
      description: description,
      barrierDismissible: barrierDismissible,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';
import 'package:training_acedamy/core/widgets/check_box/custom_check_box.dart';
import 'package:training_acedamy/features/authentication/presentation/ui/widgets/password_criteria_widget.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';
import 'package:training_acedamy/training_academy_app.dart';

void main() {
  group('PasswordCriteriaWidget', () {
    testWidgets('starts with all criteria unchecked', (tester) async {
      final passwordController = TextEditingController();
      final confirmPasswordController = TextEditingController();

      addTearDown(passwordController.dispose);
      addTearDown(confirmPasswordController.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          PasswordCriteriaWidget(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
        ),
      );

      expect(_selectedCriteriaCount(tester), 0);
    });

    testWidgets('updates password rules as password changes', (tester) async {
      final passwordController = TextEditingController();
      final confirmPasswordController = TextEditingController();

      addTearDown(passwordController.dispose);
      addTearDown(confirmPasswordController.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          PasswordCriteriaWidget(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
        ),
      );

      passwordController.text = 'Password1';
      await tester.pump();

      expect(_selectedCriteriaCount(tester), 4);
      expect(find.text('At least 8 characters'), findsOneWidget);
      expect(find.text('Contains an uppercase letter'), findsOneWidget);
      expect(find.text('Contains a lowercase letter'), findsOneWidget);
      expect(find.text('Contains a number'), findsOneWidget);
      expect(find.text('Passwords match'), findsOneWidget);
    });

    testWidgets('updates the match criterion from confirm password text', (
      tester,
    ) async {
      final passwordController = TextEditingController(text: 'Password1');
      final confirmPasswordController = TextEditingController();

      addTearDown(passwordController.dispose);
      addTearDown(confirmPasswordController.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          PasswordCriteriaWidget(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
        ),
      );

      expect(_selectedCriteriaCount(tester), 4);

      confirmPasswordController.text = 'Password1';
      await tester.pump();

      expect(_selectedCriteriaCount(tester), 5);
    });

    testWidgets('responds when controllers are replaced after build', (
      tester,
    ) async {
      final originalPasswordController = TextEditingController();
      final originalConfirmController = TextEditingController();
      final replacementPasswordController = TextEditingController(
        text: 'Password1',
      );
      final replacementConfirmController = TextEditingController(
        text: 'Password1',
      );

      addTearDown(originalPasswordController.dispose);
      addTearDown(originalConfirmController.dispose);
      addTearDown(replacementPasswordController.dispose);
      addTearDown(replacementConfirmController.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          PasswordCriteriaWidget(
            passwordController: originalPasswordController,
            confirmPasswordController: originalConfirmController,
          ),
        ),
      );

      expect(_selectedCriteriaCount(tester), 0);

      await tester.pumpWidget(
        _buildTestApp(
          PasswordCriteriaWidget(
            passwordController: replacementPasswordController,
            confirmPasswordController: replacementConfirmController,
          ),
        ),
      );
      await tester.pump();

      expect(_selectedCriteriaCount(tester), 5);
    });
  });
}

int _selectedCriteriaCount(WidgetTester tester) {
  return tester
      .widgetList<CustomCheckBox>(find.byType(CustomCheckBox))
      .where((checkbox) => checkbox.isSelected)
      .length;
}

Widget _buildTestApp(Widget child) {
  appMainNavigatorKey = GlobalKey<NavigatorState>();

  return BlocProvider(
    create: (_) => ThemeCubit(),
    child: MaterialApp(
      key: appMainNavigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

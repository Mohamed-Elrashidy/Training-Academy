import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/theme/text_styles.dart';
import 'package:training_acedamy/core/widgets/loading/custom_loading_indicator.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/employee_layout/presentation/controllers/employee_account_cubit.dart';

class EmployeeLayoutPage extends StatelessWidget {
  const EmployeeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocBuilder<EmployeeAccountCubit, EmployeeAccountState>(
        builder: (context, state) {
          if (state is EmployeeAccountLoadingState ||
              state is EmployeeAccountInitialState) {
            return const Center(child: CustomLoadingIndicator());
          }

          if (state is EmployeeAccountFailureState) {
            return Center(
              child: Text(
                state.error.message,
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
            );
          }

          final successState = state as EmployeeAccountSuccessState;

          return Center(
            child: Text(
              'Employee ${successState.account.email}',
              style: AppTextStyles.titleLarge,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}

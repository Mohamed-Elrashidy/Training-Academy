import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/widgets/navigators/bottom_navigation_bar.dart';
import 'package:training_acedamy/core/widgets/navigators/custom_drawer.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/employee_layout/presentation/controllers/employee_layout_cubit.dart';
import 'package:training_acedamy/features/employee_layout/presentation/controllers/employee_layout_state.dart';

class EmployeeLayoutPage extends StatelessWidget {
  const EmployeeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmployeeLayoutCubit>();
    final isMobile = context.isMobile;

    return BlocBuilder<EmployeeLayoutCubit, EmployeeLayoutState>(
      builder: (context, state) {
        return CustomScaffold(
          usePadding: false,
          body: isMobile
              ? Column(
                  children: [
                    Expanded(child: state.selectedModule.widget),
                    CustomBottomNavigationBar(
                      modules: cubit.mobileModules,
                      selectedModule: state.selectedModule,
                      onSelectModule: cubit.selectModule,
                    ),
                  ],
                )
              : SafeArea(
                  child: Row(
                    children: [
                      CustomDrawer(
                        modules: cubit.tabletModules,
                        selectedModule: state.selectedModule,
                        onSelectModule: cubit.selectModule,
                      ),
                      SizedBox(width: 24.sp),
                      Expanded(child: state.selectedModule.widget),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

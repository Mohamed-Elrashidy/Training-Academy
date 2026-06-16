import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/widgets/navigators/bottom_navigation_bar.dart';
import 'package:training_acedamy/core/widgets/navigators/custom_drawer.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/employee_layout/presentation/controllers/employee_layout_cubit.dart';
import 'package:training_acedamy/features/employee_layout/presentation/controllers/employee_layout_state.dart';
import 'package:training_acedamy/features/employee_module/domain/enums/employee_modules.dart';

class EmployeeLayoutPage extends StatefulWidget {
  const EmployeeLayoutPage({super.key, this.child, required this.location});

  final Widget? child;
  final String location;

  @override
  State<EmployeeLayoutPage> createState() => _EmployeeLayoutPageState();
}

class _EmployeeLayoutPageState extends State<EmployeeLayoutPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncSelectedModule();
  }

  @override
  void didUpdateWidget(covariant EmployeeLayoutPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      _syncSelectedModule();
    }
  }

  void _syncSelectedModule() {
    context.read<EmployeeLayoutCubit>().syncSelectedModule(widget.location);
  }

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
                    Expanded(child: widget.child ?? const SizedBox.shrink()),
                    CustomBottomNavigationBar(
                      modules: cubit.mobileModules,
                      selectedModule: state.selectedModule,
                      onSelectModule: (module) =>
                          _onSelectModule(context, cubit, module),
                    ),
                  ],
                )
              : SafeArea(
                  child: Row(
                    children: [
                      CustomDrawer(
                        modules: cubit.tabletModules,
                        selectedModule: state.selectedModule,
                        onSelectModule: (module) =>
                            _onSelectModule(context, cubit, module),
                      ),
                      SizedBox(width: 24.sp),
                      Expanded(child: widget.child ?? const SizedBox.shrink()),
                    ],
                  ),
                ),
        );
      },
    );
  }

  void _onSelectModule(
    BuildContext context,
    EmployeeLayoutCubit cubit,
    EmployeeModules module,
  ) {
    final route = cubit.routeForModule(module);
    cubit.selectModule(module);
    context.go(route);
  }
}

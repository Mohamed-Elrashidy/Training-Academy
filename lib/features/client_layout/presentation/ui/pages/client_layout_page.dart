import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/client_layout/domain/enums/client_modules.dart';
import 'package:training_acedamy/features/client_layout/presentation/controllers/client_layout_cubit.dart';
import 'package:training_acedamy/features/client_layout/presentation/controllers/client_layout_state.dart';

import '../../../../../core/widgets/navigators/bottom_navigation_bar.dart';
import '../../../../../core/widgets/navigators/custom_drawer.dart';

class ClientLayoutPage extends StatefulWidget {
  const ClientLayoutPage({super.key, this.child, required this.location});

  final Widget? child;
  final String location;

  @override
  State<ClientLayoutPage> createState() => _ClientLayoutPageState();
}

class _ClientLayoutPageState extends State<ClientLayoutPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncSelectedModule();
  }

  @override
  void didUpdateWidget(covariant ClientLayoutPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      _syncSelectedModule();
    }
  }

  void _syncSelectedModule() {
    context.read<ClientLayoutCubit>().syncSelectedModule(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClientLayoutCubit>();
    final isMobile = context.isMobile;

    return BlocBuilder<ClientLayoutCubit, ClientLayoutState>(
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
                      CustomDrawer<ClientModules>(
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
    ClientLayoutCubit cubit,
    ClientModules module,
  ) {
    final route = cubit.routeForModule(module);
    cubit.selectModule(module);
    context.go(route);
  }
}

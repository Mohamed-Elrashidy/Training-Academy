import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/features/client_layout/domain/enums/client_modules.dart';
import 'package:training_acedamy/features/client_layout/presentation/controllers/client_layout_cubit.dart';
import 'package:training_acedamy/features/client_layout/presentation/controllers/client_layout_state.dart';

import '../../../../../core/widgets/navigators/bottom_navigation_bar.dart';
import '../../../../../core/widgets/navigators/custom_drawer.dart';

class ClientLayoutPage extends StatelessWidget {
  const ClientLayoutPage({super.key});

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
                    Expanded(child: cubit.state.selectedModule.widget),
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
                      CustomDrawer<ClientModules>(
                        modules: cubit.tabletModules,
                        selectedModule: state.selectedModule,
                        onSelectModule: cubit.selectModule,
                      ),
                      SizedBox(width: 24.sp),
                      Expanded(
                        child: Container(
                          child: cubit.state.selectedModule.widget,
                        ),
                      ),
                    ],
                  ),
                ),
          /*          bottomNavigationBar: isMobile
              ? CustomBottomNavigationBar(
                  modules: cubit.mobileModules,
                  selectedModule: state.selectedModule,
                  onSelectModule: cubit.selectModule,
                )
              : null,*/
        );
      },
    );
  }
}

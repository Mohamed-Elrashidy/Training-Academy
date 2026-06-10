import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/features/client_layout/presentation/controllers/client_layout_cubit.dart';
import 'package:training_acedamy/features/client_layout/presentation/controllers/client_layout_state.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/widgets/drawers/custom_drawer.dart';
import '../../../domain/enums/client_modules.dart';

class ClientLayoutPage extends StatelessWidget {
  const ClientLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ClientLayoutCubit>();
    return BlocBuilder<ClientLayoutCubit, ClientLayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: Row(
            spacing: 12.sp,
            children: [
              CustomDrawer(
                modules: ClientModules.values,
                selectedModule: state.selectedModule,
                onSelectModule: (module) {
                  cubit.selectModule(module);
                },
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        );
      },
    );
  }
}

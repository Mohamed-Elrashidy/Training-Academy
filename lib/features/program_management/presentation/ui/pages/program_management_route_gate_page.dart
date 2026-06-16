import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_acedamy/core/routing/routes.dart';

class ProgramManagementRouteGatePage extends StatefulWidget {
  const ProgramManagementRouteGatePage({super.key});

  @override
  State<ProgramManagementRouteGatePage> createState() =>
      _ProgramManagementRouteGatePageState();
}

class _ProgramManagementRouteGatePageState
    extends State<ProgramManagementRouteGatePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context.go(Routes.programManagementPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

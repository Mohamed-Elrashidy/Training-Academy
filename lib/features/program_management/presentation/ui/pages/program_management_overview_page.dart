import 'package:flutter/material.dart';
import 'package:training_acedamy/core/enums/programs/program_status.dart';
import 'package:training_acedamy/core/widgets/tab_bars/number_tab_builder.dart';

class ProgramManagementOverviewPage extends StatefulWidget {
  ProgramManagementOverviewPage({super.key});

  @override
  State<ProgramManagementOverviewPage> createState() =>
      _ProgramManagementOverviewPageState();
}

class _ProgramManagementOverviewPageState
    extends State<ProgramManagementOverviewPage> {
  ProgramStatus selectedStatus = ProgramStatus.all;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumberTabBuilder<ProgramStatus>(
            getTitle: (ProgramStatus status) {
              return status.databaseName;
            },
            getNumber: (ProgramStatus status) {
              return 0;
            },
            onSelect: (ProgramStatus status) {
              selectedStatus = status;
              setState(() {});
            },
            selectedValue: selectedStatus,
            items: ProgramStatus.values,
          ),
        ],
      ),
    );
  }
}

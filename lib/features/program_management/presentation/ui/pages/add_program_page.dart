import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/app_bars/custom_app_bar.dart';
import 'package:training_acedamy/core/widgets/scaffolds/custom_scaffold.dart';
import 'package:training_acedamy/core/widgets/spacers/vertical_spacer.dart';

class AddProgramPage extends StatelessWidget {
  const AddProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          VerticalSpacer(height: 8),
          CustomAppBar(title: 'Add Program'),
          Expanded(child: SingleChildScrollView(child: Column())),
        ],
      ),
    );
  }
}

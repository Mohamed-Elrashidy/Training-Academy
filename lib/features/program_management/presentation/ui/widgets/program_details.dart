import 'package:flutter/material.dart';
import 'package:training_acedamy/core/enums/currency/currency_enum.dart';
import 'package:training_acedamy/core/enums/programs/program_category.dart';
import 'package:training_acedamy/core/enums/programs/program_type.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/widgets/fields/custom_text_field_with_title.dart';
import 'package:training_acedamy/core/widgets/layout_builders/custom_grid_view_builder.dart';
import 'package:training_acedamy/core/widgets/layout_builders/expand_wrapper.dart';
import 'package:training_acedamy/core/widgets/spacers/horizontal_spacer.dart';
import 'package:training_acedamy/features/program_management/domain/entities/program_entity.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../../../core/widgets/drop_down/single_selection_drop_down_with_title.dart';

class ProgramDetails extends StatefulWidget {
  const ProgramDetails({
    super.key,
    required this.entity,
    this.isReadOnly = false,
    this.onChanged,
  });

  final ProgramEntity entity;
  final bool isReadOnly;
  final Function()? onChanged;

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  late TextEditingController maxParticipantsController;
  late TextEditingController allowedTrainersController;
  late TextEditingController allowedCoachesController;
  late TextEditingController numberOfSessionsController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    maxParticipantsController = TextEditingController(
      text: widget.entity.maxParticipants?.toString() ?? '',
    );
    allowedTrainersController = TextEditingController(
      text: widget.entity.numberOfAllowedTrainers?.toString() ?? '',
    );
    allowedCoachesController = TextEditingController(
      text: widget.entity.numberOfAllowedCoaches?.toString() ?? '',
    );
    numberOfSessionsController = TextEditingController(
      text: widget.entity.numberOfSessions?.toString() ?? '',
    );
    priceController = TextEditingController(
      text: widget.entity.price?.toString() ?? '',
    );

    _bindControllers();
  }

  @override
  void dispose() {
    maxParticipantsController.dispose();
    allowedTrainersController.dispose();
    allowedCoachesController.dispose();
    numberOfSessionsController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void _bindControllers() {
    maxParticipantsController.addListener(() {
      widget.entity.maxParticipants = int.tryParse(
        maxParticipantsController.text,
      );
      widget.onChanged?.call();
    });
    allowedTrainersController.addListener(() {
      widget.entity.numberOfAllowedTrainers = int.tryParse(
        allowedTrainersController.text,
      );
      widget.onChanged?.call();
    });
    allowedCoachesController.addListener(() {
      widget.entity.numberOfAllowedCoaches = int.tryParse(
        allowedCoachesController.text,
      );
      widget.onChanged?.call();
    });
    numberOfSessionsController.addListener(() {
      widget.entity.numberOfSessions = int.tryParse(
        numberOfSessionsController.text,
      );
      widget.onChanged?.call();
    });
    priceController.addListener(() {
      widget.entity.price = double.tryParse(priceController.text);
      widget.onChanged?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ExpandWrapper(
      title: l10n.programDetails,
      child: CustomGridViewBuilder(
        numberOfRows: context.responsive.isMobile ? 3 : 2,
        widgets: [
          SingleSelectionDropDownWithTitle<ProgramType>(
            title: l10n.programType,
            items: [],
            selectedValue: null,
          ),
          _buildNumberField(
            title: l10n.maxParticipants,
            controller: maxParticipantsController,
            hint: l10n.maxParticipants,
          ),
          _buildNumberField(
            title: l10n.numberOfAllowedTrainers,
            controller: allowedTrainersController,
            hint: l10n.numberOfAllowedTrainers,
          ),
          _buildNumberField(
            title: l10n.numberOfAllowedCoaches,
            controller: allowedCoachesController,
            hint: l10n.numberOfAllowedCoaches,
          ),
          _buildNumberField(
            title: l10n.numberOfSessions,
            controller: numberOfSessionsController,
            hint: l10n.numberOfSessions,
          ),
          _buildPriceCurrencyField(l10n),
          SingleSelectionDropDownWithTitle<ProgramCategory>(
            title: l10n.category,
            items: [],
            selectedValue: null,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberField({
    required String title,
    required TextEditingController controller,
    required String hint,
  }) {
    return CustomTextFieldWithTitle(
      title: title,
      controller: controller,
      hint: hint,
      isReadOnly: widget.isReadOnly,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildPriceCurrencyField(AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextFieldWithTitle(
            title: l10n.price,
            controller: priceController,
            hint: l10n.price,
            isReadOnly: widget.isReadOnly,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        HorizontalSpacer(width: 8),
        Expanded(
          child: SingleSelectionDropDownWithTitle<CurrencyEnum>(
            title: l10n.currency,
            items: [],
            selectedValue: null,
          ),
        ),
      ],
    );
  }
}

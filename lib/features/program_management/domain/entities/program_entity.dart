import 'package:training_acedamy/core/configurations/app_navigator_key.dart';
import 'package:training_acedamy/core/enums/programs/duration_unit.dart';
import 'package:training_acedamy/core/enums/programs/program_category.dart';
import 'package:training_acedamy/core/enums/programs/program_status.dart';
import 'package:training_acedamy/core/enums/programs/program_type.dart';
import 'package:training_acedamy/l10n/app_localizations.dart';

import '../../../../core/enums/currency/currency_enum.dart';

class ProgramEntity {
  String? programId;
  String? englishProgramTitle;
  String? arabicProgramTitle;
  String? englishDescription;
  String? arabicDescription;
  List<String>? englishPrerequisites;
  List<String>? arabicPrerequisites;
  List<String>? englishObjectives;
  List<String>? arabicObjectives;
  List<String>? englishLearningOutcomes;
  List<String>? arabicLearningOutcomes;
  ProgramType? programType;
  int? maxParticipants;
  int? numberOfAllowedTrainers;
  int? numberOfAllowedCoaches;
  int? numberOfSessions;
  double? price;
  CurrencyEnum? currency;
  String? thumbnailUrl;
  String? coverImageUrl;
  ProgramCategory? category;
  ProgramStatus? status;
  String? notes;
  bool? hasPrerequisites;
  bool? hasLearningOutcomes;
  DateTime? startDate;
  DateTime? endDate;
  int? duration;
  DurationUnit? durationUnit;

  ProgramEntity({
    this.programId,
    this.englishProgramTitle,
    this.arabicProgramTitle,
    this.englishDescription,
    this.arabicDescription,
    this.englishPrerequisites,
    this.arabicPrerequisites,
    this.englishObjectives,
    this.arabicObjectives,
    this.englishLearningOutcomes,
    this.arabicLearningOutcomes,
    this.programType,
    this.maxParticipants,
    this.numberOfAllowedTrainers,
    this.numberOfAllowedCoaches,
    this.numberOfSessions,
    this.price,
    this.currency,
    this.thumbnailUrl,
    this.coverImageUrl,
    this.category,
    this.status,
    this.notes,
    this.hasPrerequisites,
    this.hasLearningOutcomes,
    this.startDate,
    this.endDate,
    this.duration,
    this.durationUnit,
  });

  bool get isArabicLocale {
    final context = appMainNavigatorKey.currentContext;
    if (context == null) {
      return false;
    }

    return AppLocalizations.of(context)?.localeName.startsWith('ar') ?? false;
  }

  String? get localizedProgramTitle =>
      isArabicLocale ? arabicProgramTitle : englishProgramTitle;

  String? get localizedDescription =>
      isArabicLocale ? arabicDescription : englishDescription;

  List<String>? get localizedPrerequisites =>
      isArabicLocale ? arabicPrerequisites : englishPrerequisites;

  List<String>? get localizedObjectives =>
      isArabicLocale ? arabicObjectives : englishObjectives;

  List<String>? get localizedLearningOutcomes =>
      isArabicLocale ? arabicLearningOutcomes : englishLearningOutcomes;

  static ProgramEntity newEmptyInstance() {
    return ProgramEntity();
  }
}

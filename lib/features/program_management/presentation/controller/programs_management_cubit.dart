import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'programs_management_state.dart';

class ProgramsManagementCubit extends Cubit<ProgramsManagementState> {
  ProgramsManagementCubit() : super(ProgramsManagementInitial());
}

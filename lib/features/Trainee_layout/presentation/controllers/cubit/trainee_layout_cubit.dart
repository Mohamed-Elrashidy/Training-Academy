import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/enums/trainee_layout.dart';

part 'trainee_layout_state.dart';

class TraineeLayoutCubit extends Cubit<TraineeLayoutState> {
  TraineeLayoutCubit() : super(TraineeLayoutInitial());
}

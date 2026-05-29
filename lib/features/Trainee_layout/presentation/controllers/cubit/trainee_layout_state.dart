part of 'trainee_layout_cubit.dart';

@immutable
sealed class TraineeLayoutState {}

final class TraineeLayoutInitial extends TraineeLayoutState {
  List<TraineeLayoutModules> modulesGetter() {
    return TraineeLayoutModules.values;
  }
}

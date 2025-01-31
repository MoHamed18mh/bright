import 'package:bright/features/instructor/models/instructor_model.dart';

class InstructorState {}

final class InstructorInitial extends InstructorState {}

final class InstructorLoadingState extends InstructorState {}

final class InstructorSuccessState extends InstructorState {
  final InstructorModel instructorModel;

  InstructorSuccessState({required this.instructorModel});
}

final class InstructorFailureState extends InstructorState {}

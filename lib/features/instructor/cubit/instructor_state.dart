import 'package:bright/features/instructor/models/instructor_model.dart';

class InstructorState {}

final class InstructorInitial extends InstructorState {}

final class InstructorLoading extends InstructorState {}

final class InstructorSuccess extends InstructorState {
  final InstructorModel instructorModel;

  InstructorSuccess({required this.instructorModel});
}

final class InstructorFailure extends InstructorState {}

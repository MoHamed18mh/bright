import 'package:bright/features/course/models/course_model.dart';

class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoadingState extends CourseState {}

final class CourseSuccessState extends CourseState {
  final CourseModel courseModel;

  CourseSuccessState({required this.courseModel});
}

final class CourseFailureState extends CourseState {
  final String errorMessage;

  CourseFailureState({required this.errorMessage});
  
}

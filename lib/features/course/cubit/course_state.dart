import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/models/section_model.dart';

class CourseState {}

final class CourseInitial extends CourseState {}

// course states
final class CourseLoadingState extends CourseState {}

final class CourseSuccessState extends CourseState {
  final CourseModel courseModel;

  CourseSuccessState({required this.courseModel});
}

final class CourseFailureState extends CourseState {
  final String errorMessage;

  CourseFailureState({required this.errorMessage});
}

// section states
final class SectionLoadingState extends CourseState {}

final class SectionSuccessState extends CourseState {
  final SectionModel sectionModel;

  SectionSuccessState({required this.sectionModel});
}

final class SectionFailureState extends CourseState {
  final String errorMessage;

  SectionFailureState({required this.errorMessage});
}

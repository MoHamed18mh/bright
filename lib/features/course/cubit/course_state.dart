import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/models/section_model.dart';

class CourseState {}

final class CourseInitial extends CourseState {}

// course states
final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final CourseModel courseModel;

  CourseSuccess({required this.courseModel});
}

final class CourseFailure extends CourseState {
  final String errorMessage;

  CourseFailure({required this.errorMessage});
}

// section states
final class SectionLoading extends CourseState {}

final class SectionSuccess extends CourseState {
  final SectionModel sectionModel;

  SectionSuccess({required this.sectionModel});
}

final class SectionFailure extends CourseState {
  final String errorMessage;

  SectionFailure({required this.errorMessage});
}

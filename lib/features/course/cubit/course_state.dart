import 'package:bright/features/course/models/course_model.dart';

class CourseState {}

final class CourseInitial extends CourseState {}

// // ***************** categories states
// final class CategoryLoadingState extends CourseState {}

// final class CategorySuccessState extends CourseState {
//   final CategoryModel categoryModel;

//   CategorySuccessState({required this.categoryModel});
// }

// final class CategoryFailureState extends CourseState {
//   final String errorMessage;

//   CategoryFailureState({required this.errorMessage});
// }
// // ********************


// ***************** cours states
final class CourseLoadingState extends CourseState {}

final class CourseSuccessState extends CourseState {
  final CourseModel courseModel;

  CourseSuccessState({required this.courseModel});
}

final class CourseFailureState extends CourseState {
  final String errorMessage;

  CourseFailureState({required this.errorMessage});
}
// ********************

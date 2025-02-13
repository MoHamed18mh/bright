import 'package:bright/core/repositories/course_repo.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this.courseRepo) : super(CourseInitial());

  final CourseRepo courseRepo;

  // There is an issue that prevents getCourses and getCategories from executing together
  //
  // Future<void> getCategories() async {
  //   emit(CategoryLoadingState());
  //   final response = await courseRepo.getCategories();
  //   response.fold(
  //     (errorMessage) => emit(CategoryFailureState(errorMessage: errorMessage)),
  //     (categoryModel) =>
  //         emit(CategorySuccessState(categoryModel: categoryModel)),
  //   );
  // }

  Future<void> getCourses() async {
    emit(CourseLoadingState());
    final response = await courseRepo.getCourses();
    response.fold(
      (errorMessage) => emit(CourseFailureState(errorMessage: errorMessage)),
      (courseModel) =>
          emit(CourseSuccessState(courseModel: courseModel)),
    );
  }
}

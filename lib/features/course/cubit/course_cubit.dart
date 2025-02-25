import 'package:bright/core/repositories/course_repo.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this.courseRepo) : super(CourseInitial());

  final CourseRepo courseRepo;

  Future<void> getCourses() async {
    emit(CourseLoading());
    final response = await courseRepo.getCourses();
    response.fold(
      (errorMessage) => emit(CourseFailure(errorMessage: errorMessage)),
      (courseModel) => emit(CourseSuccess(courseModel: courseModel)),
    );
  }

  Future<void> getSections(int courseId) async {
    emit(SectionLoading());
    final response = await courseRepo.getSections(courseId);
    response.fold(
      (errorMessage) => emit(SectionFailure(errorMessage: errorMessage)),
      (sectionModel) => emit(SectionSuccess(sectionModel: sectionModel)),
    );
  }
}

import 'package:bright/core/repositories/course_repo.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this.courseRepo) : super(CourseInitial());

  final CourseRepo courseRepo;

  Future<void> getCourses() async {
    emit(CourseLoadingState());
    final response = await courseRepo.getCourses();
    response.fold(
      (errorMessage) => emit(CourseFailureState(errorMessage: errorMessage)),
      (courseModel) => emit(CourseSuccessState(courseModel: courseModel)),
    );
  }

  Future<void> getSections(courseId) async {
    emit(SectionLoadingState());
    final response = await courseRepo.getSections(courseId);
    response.fold(
      (errorMessage) => emit(SectionFailureState(errorMessage: errorMessage)),
      (sectionModel) => emit(SectionSuccessState(sectionModel: sectionModel)),
    );
  }
}

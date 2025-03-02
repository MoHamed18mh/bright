import 'package:android_intent_plus/android_intent.dart';
import 'package:bright/core/repositories/course_repo.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this.courseRepo) : super(CourseInitial());

  final CourseRepo courseRepo;

  // call getCourses from courseRepo
  Future<void> getCourses() async {
    emit(CourseLoading());
    final response = await courseRepo.getCourses();
    response.fold(
      (errorMessage) => emit(CourseFailure(errorMessage: errorMessage)),
      (courseModel) => emit(CourseSuccess(courseModel: courseModel)),
    );
  }

  // call getSections from coursRepo
  Future<void> getSections(int courseId) async {
    emit(SectionLoading());
    final response = await courseRepo.getSections(courseId);
    response.fold(
      (errorMessage) => emit(SectionFailure(errorMessage: errorMessage)),
      (sectionModel) => emit(SectionSuccess(sectionModel: sectionModel)),
    );
  }

  // call getVideos from courseRepo
  Future<void> getVideos(int sectionId) async {
    emit(VideoLoading());
    final response = await courseRepo.getVideos(sectionId);
    response.fold(
      (errorMessage) => emit(VideoFailure(errorMessage: errorMessage)),
      (videoModel) => emit(VideoSuccess(videoModel: videoModel)),
    );
  }

  // play video in external player
  void playVideo(String url) {
    AndroidIntent(
      data: url,
      action: 'action_view',
      type: 'video/mp4',
    ).launch();
  }
}

import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/api/errors/exception.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/models/section_model.dart';
import 'package:bright/features/course/models/video_model.dart';
import 'package:dartz/dartz.dart';

class CourseRepo {
  final ApiConsumer api;

  CourseRepo({required this.api});

  // get all courses
  Future<Either<String, CourseModel>> getCourses() async {
    try {
      final response = await api.get(EndPoint.getCourses);

      return Right(CourseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }

  // Get course sections based on [courseId]
  Future<Either<String, SectionModel>> getSections(int courseId) async {
    try {
      final response = await api.get(EndPoint.getSection(courseId));

      return Right(SectionModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }

  // get videos based on sectionId
  Future<Either<String, VideoModel>> getVideos(int sectionId) async {
    try {
      final response = await api.get(EndPoint.getVideo(sectionId));

      return Right(VideoModel.formJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }
}

import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/api/errors/exception.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/models/section_model.dart';
import 'package:dartz/dartz.dart';

class CourseRepo {
  final ApiConsumer api;

  CourseRepo({required this.api});

  Future<Either<String, CourseModel>> getCourses() async {
    try {
      final response = await api.get(EndPoint.getCourses);
      return Right(CourseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(AppStrings.unexpectedError);
    }
  }

  Future<Either<String, SectionModel>> getSections(courseId) async {
    try {
      final response = await api.get(EndPoint.getSection(courseId));
      return Right(SectionModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(AppStrings.unexpectedError);
    }
  }
}

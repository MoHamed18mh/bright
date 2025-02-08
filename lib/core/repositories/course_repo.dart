import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/errors/api_error/exception.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/course/models/category_model.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:dartz/dartz.dart';

class CourseRepo {
  final ApiConsumer api;

  CourseRepo({required this.api});

  // get all categories from api
  Future<Either<String, CategoryModel>> getCategories() async {
    try {
      final response = await api.get(
        EndPoint.getCategories,
      );
      return Right(CategoryModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(AppStrings.unexpectedError);
    }
  }

  Future<Either<String, CourseModel>> getCourses() async {
    try {
      final response = await api.get(
        EndPoint.getCourses,
      );
      return Right(CourseModel.fromJson(response));
    } on ServerException catch (e) {
      print('================ ${e.toString()}');
      return Left(e.errorModel.message);
    } catch (e) {
      print('__________________ ${e.toString()}');
      return Left(AppStrings.unexpectedError);
    }
  }
}

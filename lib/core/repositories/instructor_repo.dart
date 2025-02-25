import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/api/errors/exception.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:dartz/dartz.dart';

class InstructorRepo {
  final ApiConsumer api;

  InstructorRepo({required this.api});

  // get all instructors from api
  Future<Either<String, InstructorModel>> getInstructors() async {
    try {
      final response = await api.get(EndPoint.getInstructors);

      return Right(InstructorModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }
}

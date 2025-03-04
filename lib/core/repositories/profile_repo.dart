import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/api/errors/exception.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/profile/models/profile_model.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  final ApiConsumer api;

  ProfileRepo({required this.api});

  Future<Either<String, ProfileModel>> getUser(String userId) async {
    try {
      final response = await api.get(EndPoint.getUser(userId));

      return Right(ProfileModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }
}

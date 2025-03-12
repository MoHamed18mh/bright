import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/api/errors/exception.dart';
import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/profile/models/profile_model.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  final ApiConsumer api;

  ProfileRepo({required this.api});

  String userId = getIt<CacheHelper>().getData(key: CacheKey.userId);

  // get user info
  Future<Either<String, ProfileModel>> getUser() async {
    try {
      final response = await api.get(EndPoint.getUser(userId));

      return Right(ProfileModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }

  // edit user info
  Future<Either<List<String>?, String>> editUser(
      String firstName, String lastName, String mobile, dynamic image) async {
    try {
      await api.put(
        EndPoint.putEditUser(userId),
        data: {
          ApiKey.id: userId,
          ApiKey.firstName: firstName,
          ApiKey.lastName: lastName,
          ApiKey.mobile: mobile,
          ApiKey.image: image,
        },
        queryParameters: {
          ApiKey.token: getIt<CacheHelper>().getData(key: CacheKey.token)
        },
        isFormData: true,
      );

      return const Right('Done');
    } on ServerException catch (e) {
      return Left(e.errorModel.errors);
    } catch (e) {
      return const Left([AppStrings.unexpectedError]);
    }
  }

  // delete account
  Future<Either<String, String>> deleteAccount() async {
    try {
      await api.delete(EndPoint.deleteAccount(userId));

      return const Right('Done');
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return const Left(AppStrings.unexpectedError);
    }
  }
}

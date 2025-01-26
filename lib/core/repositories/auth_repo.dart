import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/errors/api_error/exception.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:bright/features/auth/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  // prepare login function with api
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.login,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final LoginModel loginModel = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(loginModel.token);
      await getIt<CacheHelper>()
          .saveData(key: CacheKey.userId, value: decodedToken[ApiKey.idSchema]);
      return Right(loginModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left('Unexpected error occurred: ${e.toString()}');
    }
  }
}

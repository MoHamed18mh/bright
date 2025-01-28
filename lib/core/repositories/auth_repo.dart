import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/errors/api_error/exception.dart';
import 'package:bright/core/routes/deep_links_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/auth/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  // ********** prepare register and send verify email method with api *********
  Future<Either<List<String>, String>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // register function
      await api.post(
        EndPoint.register,
        data: {
          ApiKey.rFirstName: firstName,
          ApiKey.rLastName: lastName,
          ApiKey.email: email,
          ApiKey.rMobile: mobile,
          ApiKey.rPassword: password,
          ApiKey.rConfirmPassword: confirmPassword,
        },
        isFormData: true,
      );
      // send email verify
      await api.post(
        EndPoint.authenticate,
        data: {
          ApiKey.email: email,
          ApiKey.clientUrl: DeepLinksKey.verifyDeepLink,
        },
      );
      return Right(AppStrings.pleaseCheckEmail);
    } on ServerException catch (e) {
      return Left(e.errorModel.errors!);
    } catch (e) {
      return Left([AppStrings.unexpectedError]);
    }
  }

  // confirm email method
  Future<Either<String, String>> confirmEmail(
      {required String email, required String token}) async {
    try {
      await api.post(
        EndPoint.confirmEmail,
        data: {
          ApiKey.email: email,
          ApiKey.token: token,
        },
      );
      return Right(AppStrings.verifyDone);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(AppStrings.unexpectedError);
    }
  }
  // ***************************************************************************

  // ********************* prepare login method with api ***********************
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
      return Left(AppStrings.unexpectedError);
    }
  }
  // ***************************************************************************

  // ******************* prepare forgotPassword method *************************

  // ******************* send verify email
  Future<Either<String, String>> forgotPassword({required String email}) async {
    try {
      await api.post(
        EndPoint.forgotPassword,
        data: {
          ApiKey.email: email,
          ApiKey.clientUrl: DeepLinksKey.forgotPasswordDeepLink,
        },
      );
      return Right(AppStrings.pleaseCheckEmail);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(AppStrings.unexpectedError);
    }
  }

  // ********************* reset password
  Future<Either<String, String>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await api.post(EndPoint.resetPassword, data: {
        ApiKey.email: email,
        ApiKey.token: token,
        ApiKey.password: password,
        ApiKey.confirmPassword: confirmPassword,
      });
      return Right(AppStrings.successResetPassword);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
  // ***************************************************************************
}

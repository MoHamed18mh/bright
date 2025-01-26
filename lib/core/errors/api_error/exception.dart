import 'package:bright/core/errors/api_error/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handelException(DioException e) {
  if (e.response != null && e.response!.data != null) {
    throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
  } else {
    throw ServerException(
      errorModel: ErrorModel(
        statusCode: 0,
        message: e.message ?? 'Unknown error',
        errors: null,
      ),
    );
  }
}

import 'package:bright/core/api/api_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/errors/api_error/exception.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    // dio.interceptors.add(LogInterceptor());
    // dio.interceptors.add(ApiInterceptor());
  }

  @override
  Future get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelException(e);
    }
  }

  @override
  Future delet(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelException(e);
    }
  }

  @override
  Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelException(e);
    }
  }

  @override
  Future put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelException(e);
    }
  }
}

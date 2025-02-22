import 'package:bright/core/api/end_point.dart';

class ErrorModel {
  final int statusCode;
  final String message;
  final List<String>? errors;

  ErrorModel(
      {required this.statusCode, required this.message, required this.errors});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json[ApiKey.statusCode],
      message: json[ApiKey.message],
      errors: json[ApiKey.errors] != null
          ? List<String>.from(json[ApiKey.errors])
          : null,
    );
  }
}

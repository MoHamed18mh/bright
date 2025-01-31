import 'package:bright/core/api/end_point.dart';
import 'package:bright/features/instructor/models/data_model.dart';

class InstructorModel {
  final bool success;
  final String message;
  final int statusCode;
  final DataModel data;

  InstructorModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      statusCode: json[ApiKey.statusCode],
      data: DataModel.fromJson(json[ApiKey.data]),
    );
  }
}


import 'package:bright/core/api/end_point.dart';

class InstructorModel {
  final bool success;
  final String message;
  final int statusCode;
  final InstructorData instructorData;

  InstructorModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.instructorData,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      statusCode: json[ApiKey.statusCode],
      instructorData: InstructorData.fromJson(json[ApiKey.data]),
    );
  }
}

//
class InstructorData {
  final int pageSize;
  final int count;
  final int pageIndex;
  final List<InstructorItem> instructorItem;

  InstructorData({
    required this.pageSize,
    required this.count,
    required this.pageIndex,
    required this.instructorItem,
  });

  factory InstructorData.fromJson(Map<String, dynamic> json) {
    return InstructorData(
      pageSize: json[ApiKey.pageSize],
      count: json[ApiKey.count],
      pageIndex: json[ApiKey.pageIndex],
      instructorItem: List<InstructorItem>.from(
          json[ApiKey.items].map((e) => InstructorItem.fromJson(e))),
    );
  }
}

//
class InstructorItem {
  final String qualifications;
  final String userId;
  final String jobTitle;
  final String displayName;
  final String mobile;
  final String imageCover;
  final String email;

  InstructorItem({
    required this.qualifications,
    required this.userId,
    required this.jobTitle,
    required this.displayName,
    required this.mobile,
    required this.imageCover,
    required this.email,
  });

  factory InstructorItem.fromJson(Map<String, dynamic> json) {
    return InstructorItem(
      qualifications: json[ApiKey.qualifications],
      userId: json[ApiKey.userId],
      jobTitle: json[ApiKey.jobTitle],
      displayName: json[ApiKey.displayName],
      mobile: json[ApiKey.mobile],
      imageCover: json[ApiKey.imageCover],
      email: json[ApiKey.email],
    );
  }
}

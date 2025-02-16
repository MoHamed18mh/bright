import 'package:bright/core/api/end_point.dart';

class CourseModel {
  final bool success;
  final String message;
  final int statusCode;
  final CourseData courseData;

  CourseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.courseData,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      statusCode: json[ApiKey.statusCode],
      courseData: CourseData.fromJson(json[ApiKey.data]),
    );
  }
}

class CourseData {
  final int pageSize;
  final int count;
  final int pageIndex;
  final List<CourseItem> courseItem;

  CourseData({
    required this.pageSize,
    required this.count,
    required this.pageIndex,
    required this.courseItem,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    var itemsList = json[ApiKey.items] as List;
    List<CourseItem> items =
        itemsList.map((e) => CourseItem.fromJson(e)).toList();

    return CourseData(
      pageSize: json[ApiKey.pageSize],
      count: json[ApiKey.count],
      pageIndex: json[ApiKey.pageIndex],
      courseItem: items,
    );
  }
}

class CourseItem {
  final int id;
  final String name;
  final double price;
  final String description;
  final String instructorName;
  final String pictureUrl;
  final String createdData;
  final String updatedData;

  CourseItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.instructorName,
    required this.pictureUrl,
    required this.createdData,
    required this.updatedData,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: json[ApiKey.id] ?? 0,
      name: json[ApiKey.name] ?? '',
      price: json[ApiKey.price] ?? 0.0,
      description: json[ApiKey.description] ?? '',
      instructorName: json[ApiKey.instructorName] ?? '',
      pictureUrl: json[ApiKey.pictureUrl] ?? '',
      createdData: json[ApiKey.createdDate] ?? '',
      updatedData: json[ApiKey.updatedDate] ?? '',
    );
  }
}

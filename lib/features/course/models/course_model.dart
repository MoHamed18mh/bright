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

//
class CourseData {
  final int pageSize;
  final int count;
  final int pageIndex;
  final List<CourseItems> courseItems;

  CourseData({
    required this.pageSize,
    required this.count,
    required this.pageIndex,
    required this.courseItems,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    var itemsList = json[ApiKey.items] as List;
    List<CourseItems> items =
        itemsList.map((e) => CourseItems.fromJson(e)).toList();

    return CourseData(
      pageSize: json[ApiKey.pageSize],
      count: json[ApiKey.count],
      pageIndex: json[ApiKey.pageIndex],
      courseItems: items,
    );
  }
}

//
class CourseItems {
  final int id;
  final String name;
  final double price;
  final String description;
  final String instructorName;
  final String pictureUrl;
  final String createdDate;
  final String updatedDate;
  final String? sections;

  CourseItems({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.instructorName,
    required this.pictureUrl,
    required this.createdDate,
    required this.updatedDate,
    this.sections,
  });

  factory CourseItems.fromJson(Map<String, dynamic> json) {
    return CourseItems(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      price: json[ApiKey.price],
      description: json[ApiKey.description],
      instructorName: json[ApiKey.instructorName],
      pictureUrl: json[ApiKey.pictureUrl],
      createdDate: json[ApiKey.createdDate],
      updatedDate: json[ApiKey.updatedDate],
      sections: json[ApiKey.sections],
    );
  }
}

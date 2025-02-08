import 'package:bright/core/api/end_point.dart';

class CategoryModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<CategoryData> categoryData;

  CategoryModel(
      {required this.success,
      required this.message,
      required this.statusCode,
      required this.categoryData});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var dataList = json[ApiKey.data] as List;
    List<CategoryData> data =
        dataList.map((e) => CategoryData.fromJson(e)).toList();

    return CategoryModel(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      statusCode: json[ApiKey.statusCode],
      categoryData: data,
    );
  }
}

class CategoryData {
  final int id;
  final String name;

  CategoryData({
    required this.id,
    required this.name,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
    );
  }
}

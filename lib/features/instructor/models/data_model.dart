import 'package:bright/core/api/end_point.dart';

class DataModel {
  final int pageSize;
  final int count;
  final int pageIndex;
  final List<ItemModel> items;

  DataModel({
    required this.pageSize,
    required this.count,
    required this.pageIndex,
    required this.items,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    // convert items in json to ItemModel
    var itemsList = json[ApiKey.items] as List;
    List<ItemModel> items =
        itemsList.map((e) => ItemModel.fromJson(e)).toList();

    return DataModel(
      pageSize: json[ApiKey.pageSize],
      count: json[ApiKey.count],
      pageIndex: json[ApiKey.pageIndex],
      items: items,
    );
  }
}

// 
class ItemModel {
  final String qualifications;
  final String userId;
  final String jobTitle;
  final String displayName;
  final String mobile;
  final String imageCover;
  final String email;

  ItemModel({
    required this.qualifications,
    required this.userId,
    required this.jobTitle,
    required this.displayName,
    required this.mobile,
    required this.imageCover,
    required this.email,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
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

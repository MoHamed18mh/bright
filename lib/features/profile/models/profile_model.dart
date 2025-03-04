import 'package:bright/core/api/end_point.dart';

class ProfileModel {
  final String message;
  final ProfileData profileData;

  ProfileModel({
    required this.message,
    required this.profileData,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      message: json[ApiKey.profileMess],
      profileData: ProfileData.fromJson(json[ApiKey.data]),
    );
  }
}

class ProfileData {
  final String id;
  final String email;
  final String displayName;
  final String imageCover;
  final String mobile;
  final double waletBalance;

  ProfileData({
    required this.id,
    required this.email,
    required this.displayName,
    required this.imageCover,
    required this.mobile,
    required this.waletBalance,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json[ApiKey.id],
      email: json[ApiKey.email],
      displayName: json[ApiKey.displayName],
      imageCover: json[ApiKey.imageCover],
      mobile: json[ApiKey.mobile],
      waletBalance: json[ApiKey.walletBalance],
    );
  }
}

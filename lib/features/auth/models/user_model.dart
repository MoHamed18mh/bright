import 'package:bright/core/api/end_point.dart';

class UserModel {
  final String email;
  final String displayName;
  final int? id;
  final double? walletBalance;
  final String? mobile;
  final String? imageCover;

  UserModel({
    required this.email,
    required this.displayName,
    required this.id,
    required this.walletBalance,
    required this.mobile,
    required this.imageCover,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json[ApiKey.email],
      displayName: json[ApiKey.displayName],
      id: json[ApiKey.id],
      walletBalance: json[ApiKey.walletBalance]?.toDouble() ?? 0.0,
      mobile: json[ApiKey.mobile],
      imageCover: json[ApiKey.imageCover],
    );
  }
}

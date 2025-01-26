import 'package:bright/core/api/end_point.dart';
import 'package:bright/features/auth/models/user_model.dart';

class LoginModel {
  final String message;
  final String token;
  final UserModel user;

  LoginModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json[ApiKey.message],
      token: json[ApiKey.token],
      user: UserModel.fromJson(json[ApiKey.user]),
    );
  }
}

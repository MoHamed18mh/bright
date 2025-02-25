import 'package:bright/core/api/end_point.dart';

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

class UserModel {
  final String email;
  final String displayName;

  UserModel({
    required this.email,
    required this.displayName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json[ApiKey.email],
      displayName: json[ApiKey.displayName],
    );
  }
}

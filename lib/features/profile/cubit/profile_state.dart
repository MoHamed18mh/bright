import 'package:bright/features/profile/models/profile_model.dart';

class ProfileState {}

final class ProfileInitial extends ProfileState {}

// upload user image
final class UpLoadUserImage extends ProfileState {}

// user states
final class GetUserLoading extends ProfileState {}

final class GetUserSuccess extends ProfileState {
  final ProfileModel profileModel;

  GetUserSuccess({required this.profileModel});
}

final class GetUserFailure extends ProfileState {
  final String errorMessage;

  GetUserFailure({required this.errorMessage});
}

// edit user state
final class EditUserLoading extends ProfileState {}

final class EditUserSuccess extends ProfileState {
  final String message;

  EditUserSuccess({required this.message});
}

final class EditUserFailure extends ProfileState {
  final List<String>? errorMessage;

  EditUserFailure({required this.errorMessage});
}

import 'package:bright/features/profile/models/profile_model.dart';

class ProfileState {}

// user states
final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess({required this.profileModel});
}

final class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});
}

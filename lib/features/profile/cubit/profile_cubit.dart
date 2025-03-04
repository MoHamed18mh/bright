import 'package:bright/core/repositories/profile_repo.dart';
import 'package:bright/features/profile/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  Future<void> getUser(String userId) async {
    emit(ProfileLoading());
    final response = await profileRepo.getUser(userId);
    response.fold(
      (errorMessage) => emit(ProfileFailure(errorMessage: errorMessage)),
      (profileModel) => emit(ProfileSuccess(profileModel: profileModel)),
    );
  }
}

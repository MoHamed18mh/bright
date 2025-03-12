import 'package:bright/core/functions/upload_imgae_to_api.dart';
import 'package:bright/core/repositories/profile_repo.dart';
import 'package:bright/features/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  // image var
  XFile? userImage;

  // edit keys
  GlobalKey<FormState> editKey = GlobalKey<FormState>();
  TextEditingController editFirstNameController = TextEditingController();
  TextEditingController editLastNameController = TextEditingController();
  TextEditingController editMobileController = TextEditingController();

  // get user info
  Future<void> getUser() async {
    emit(GetUserLoading());
    final response = await profileRepo.getUser();

    response.fold(
      (errorMessage) => emit(GetUserFailure(errorMessage: errorMessage)),
      (profileModel) => emit(GetUserSuccess(profileModel: profileModel)),
    );
  }

  // edit user info
  Future<void> editUser() async {
    emit(EditUserLoading());
    final response = await profileRepo.editUser(
      editFirstNameController.text,
      editLastNameController.text,
      editMobileController.text,
      await uploadImageToApi(userImage!),
    );

    response.fold(
      (errorMessage) => emit(EditUserFailure(errorMessage: errorMessage)),
      (message) => emit(EditUserSuccess(message: message)),
    );
  }

  // upload user image
  void upLoadUserImage(XFile image) {
    userImage = image;
    emit(UpLoadUserImage());
  }
}

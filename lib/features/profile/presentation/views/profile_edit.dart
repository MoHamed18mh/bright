import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/material_button_widget.dart';
import '../widgets/custom_text_filed.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _EditProfileState();
}

class _EditProfileState extends State<ProfileEdit> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Choose Image Source"),
        actions: [
          TextButton(
            onPressed: () => _handleImagePick(ImageSource.camera),
            child: const Text("Camera"),
          ),
          TextButton(
            onPressed: () => _handleImagePick(ImageSource.gallery),
            child: const Text("Gallery"),
          ),
        ],
      ),
    );
  }

  void _handleImagePick(ImageSource source) {
    pickImage(source);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: AppColors.primaryHighLight,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.padding, vertical: AppSpace.meduim1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: showImageSourceDialog,
                      child: CircleAvatar(
                        backgroundImage: image != null
                            ? FileImage(image!)
                            : const AssetImage('assets/images/User.png')
                        as ImageProvider,
                        maxRadius: 60,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.1 * 255).toInt()),
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpace.meduim1),
              CustomTextFiled(text: "Full Name"),
              CustomTextFiled(text: "Email"),
              CustomTextFiled(text: "Phone"),
              const SizedBox(height: AppSpace.meduim1),
              MaterialButtonWidget(
                onPressed: () {},
                text: "Log Out",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

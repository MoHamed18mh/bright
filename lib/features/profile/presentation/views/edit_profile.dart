import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/material_button_widget.dart';
import '../widgets/custom_text_filed.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = 'editProfile';

  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: image != null
                      ? FileImage(image!)
                      :  AssetImage(Assets.assetsImagesProfile)
                          as ImageProvider,
                  maxRadius: 60,
                ),
                InkWell(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                  },
                  child: Text(
                    'Change Picture',
                    style: AppTextStyle.nunitoSans22LightBlackBold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('First Name',
                        style: AppTextStyle.nunitoSans22LightBlackBold),
                    CustomTextFiled(text: "First Name"),
                    Text('Last Name',
                        style: AppTextStyle.nunitoSans22LightBlackBold),
                    CustomTextFiled(text: "Last Name"),
                    Text('Email',
                        style: AppTextStyle.nunitoSans22LightBlackBold),
                    CustomTextFiled(text: "Email"),
                    Text('Phone Number',
                        style: AppTextStyle.nunitoSans22LightBlackBold),
                    CustomTextFiled(text: "Phone Number"),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButtonWidget(text: "Update", onPressed: () {})),
          ]),
        ),
      ),
    );
  }
}

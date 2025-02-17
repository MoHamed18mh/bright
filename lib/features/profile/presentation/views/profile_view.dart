import 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/material_button_widget.dart';
import '../widgets/profile_item.dart';
import 'edit_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const CircleAvatar(
                backgroundImage: AssetImage(Assets.assetsImagesProfile),
                maxRadius: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('User Name',
                    style: AppTextStyle.nunitoSans26LightBlackBold),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  },
                  child: ImageIcon(
                    AssetImage('assets/images/Edit.png'),
                    color: AppColors.primaryColor,
                  ),
                )
              ]),
              Text('Email@gmail.com',
                  style: AppTextStyle.notoSerif20PrimaryBold.copyWith(
                    color: Colors.grey[500],
                  )),
            ]),
            const SizedBox(height: 20),
            const ProfileItem(iconName: 'details', itemName: 'My Details'),
            const ProfileItem(iconName: 'cart', itemName: 'Cart'),
            const ProfileItem(iconName: 'payment', itemName: 'Payment Methods'),
            const ProfileItem(iconName: 'phone', itemName: 'Phone '),
            // const ProfileItem(iconName: 'help', itemName: 'Help '),
            // const ProfileItem(iconName: 'about', itemName: 'About  '),
            const Divider(
              height: 40,
              thickness: 1,
            ),
            const Spacer(),
            MaterialButtonWidget(text: "Log Out", onPressed: () {})
          ]),
        ),
      ),
    );
  }
}

import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:bright/features/profile/presentation/widgets/customs/custom_edit_text_field.dart';
import 'package:bright/features/profile/presentation/widgets/edit_image_widget.dart';
import 'package:flutter/material.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.padding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: BackButtonWidget(),
              floating: true,
            ),

            // user image
            SliverToBoxAdapter(child: EditImageWidget()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim1)),

            // user info
            SliverToBoxAdapter(child: CustomEditTextField()),
          ],
        ),
      ),
    );
  }
}


import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/routes/route_key.dart';
import '../../../../core/utils/app_space.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/back_button_widget.dart';

class MyDetailsView extends StatelessWidget {
  const MyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        actions: [
          IconButton(
            onPressed: () => navigate(context, RouteKey.profileEdit),
            icon: ImageIcon(
              const AssetImage("assets/images/edit.png"),
              color: AppColors.primaryColor,
            ),
          )
        ],
        backgroundColor: AppColors.primaryHighLight,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 68,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        "assets/images/User.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person,
                              size: 120, color: Colors.grey);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpace.meduim2),
            ),
            SliverToBoxAdapter(
              child: Text(
                'User Name',
                style: AppTextStyle.notoSerif22LightBlackBold,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpace.meduim1),
            ),
            SliverToBoxAdapter(
              child: Text(
                'UserName@gmail.com',
                style: AppTextStyle.notoSerif22LightBlackBold,
                textAlign: TextAlign.start,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpace.meduim1),
            ),
            SliverToBoxAdapter(
              child: Text(
                '01234567890',
                style: AppTextStyle.notoSerif22LightBlackBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

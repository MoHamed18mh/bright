import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/custom/custom_image_head.dart';
import 'package:bright/core/widgets/custom/custom_part_title.dart';
import 'package:bright/features/contact/presentation/widgets/customs/custom_contact_info.dart';
import 'package:bright/features/contact/presentation/widgets/customs/custom_contact_form.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomImageHead(
            title: AppStrings.contact,
            imagePath: Assets.assetsImagesContactus,
          ),
        ),

        const SliverToBoxAdapter(
          child: CustomPartTitle(
            title: AppStrings.contactUs,
            subTitle: AppStrings.contactForAny,
          ),
        ),
        
        //  contact description
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
            child: Text(
              AppStrings.getInToutch,
              style: AppTextStyle.nunitoSans22LightBlackBold,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
            child: Text(
              AppStrings.theContactForm,
              style: AppTextStyle.nunitoSans16LightBlackBold,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.main)),

        const CustomContactInfo(),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.max1)),

        const SliverToBoxAdapter(child: CustomContactForm()),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.max1)),
      ],
    ));
  }
}

import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/coustom/custom_header_image.dart';
import 'package:bright/core/widgets/coustom/custom_section_header.dart';
import 'package:bright/features/contact/presentation/widgets/contact_info_widget.dart';
import 'package:bright/features/contact/presentation/widgets/customs/custom_contact_form.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomHeaderImage(
            title: AppStrings.contact,
            imagePath: Assets.assetsImagesContactus,
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.maxSpace2)),

        // ***************** contact description
        SliverToBoxAdapter(
          child: CustomSectionHeader(
            title: AppStrings.contactUs,
            subTitle: AppStrings.contactForAny,
          ),
        ),
        SliverToBoxAdapter(
          child: const SizedBox(height: AppSpace.meduimSpace1),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
            child: Text(
              AppStrings.getInToutch,
              style: AppTextStyle.nunitoSans22LightBlackBold,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
            child: Text(
              AppStrings.theContactForm,
              style: AppTextStyle.nunitoSans16LightBlackBold,
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.mainSpace)),
        // **********

        ContactInfoWidget(),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.maxSpace1)),

        SliverToBoxAdapter(child: CustomContactForm()),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.maxSpace1)),
      ],
    ));
  }
}

import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class VideoAppBarWidget extends StatelessWidget {
  const VideoAppBarWidget({
    super.key,
    required this.sectionName,
  });

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const BackButtonWidget(),
      titleSpacing: AppSpace.small1,
      title: Text(
        sectionName,
        style: AppTextStyle.nunitoSans18LightBlackBold,
      ),
      floating: true,
      backgroundColor: Colors.white,
    );
  }
}

import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/course/models/section_model.dart';
import 'package:flutter/material.dart';

class SectionChipeWidget extends StatelessWidget {
  const SectionChipeWidget({
    super.key,
    required this.sectionModel,
  });
  final SectionModel sectionModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpace.meduim1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sectionModel.sectionData.length,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSpace.small1),
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.small2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    sectionModel.sectionData[index].name,
                    style: AppTextStyle.nunitoSans14Grey800,
                  ),
                ],
              ));
        },
      ),
    );
  }
}

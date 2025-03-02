import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/course/models/video_model.dart';
import 'package:bright/features/course/presentation/widgets/video_item_widget.dart';
import 'package:flutter/material.dart';

class CustomVideosList extends StatelessWidget {
  const CustomVideosList({super.key, required this.videoModel});

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSpace.size3,
        mainAxisExtent: AppSpace.max3,
      ),
      itemCount: videoModel.videoData.length,
      itemBuilder: (context, index) => VideoItemWidget(
        videoData: videoModel.videoData[index],
      ),
    );
  }
}
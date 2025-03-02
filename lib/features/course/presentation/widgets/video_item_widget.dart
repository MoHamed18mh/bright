import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/models/video_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({super.key, required this.videoData});

  final VideoData videoData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<CourseCubit>().playVideo(videoData.videoUrl),
      child: Container(
        margin: const EdgeInsets.all(AppSpace.padding),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 5),
            blurRadius: 12,
          )
        ]),
        child: Row(
          children: [
            // video image cover
            CachedNetworkImage(
              imageUrl: videoData.coverUrl,
              height: AppSpace.max3,
              width: AppSpace.max2,
              fit: BoxFit.cover,
              memCacheHeight: 180,
              placeholder: (context, url) => const ContainerShimmerWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: AppSpace.small2),

            // video info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // video title
                  Text(
                    videoData.name,
                    style: AppTextStyle.nunitoSans16LightBlackBold,
                  ),

                  // video description
                  Text(
                    videoData.description,
                    style: AppTextStyle.nunitoSans14Grey800,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: AppSpace.small2),

                  // video time
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.small2,
                      vertical: AppSpace.small1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlack.withAlpha(200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      videoData.duration.toString(),
                      style: AppTextStyle.nunitoSans15WhiteBlod,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

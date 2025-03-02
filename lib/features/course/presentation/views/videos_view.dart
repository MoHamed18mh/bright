import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/presentation/widgets/custom/custom_video_list.dart';
import 'package:bright/features/course/presentation/widgets/video_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosView extends StatelessWidget {
  const VideosView(
      {super.key, required this.sectionName, required this.sectionId});

  final String sectionName;
  final int sectionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          body: (state is VideoSuccess)
              ? CustomScrollView(
                  slivers: [
                    // app bar
                    VideoAppBarWidget(sectionName: sectionName),

                    // video list
                    CustomVideosList(videoModel: state.videoModel),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
        );
      },
    );
  }
}




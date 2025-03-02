import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/presentation/widgets/horizontal_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSectionsList extends StatelessWidget {
  const CustomSectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (state is SectionSuccess) {
                return HorizontalListWidget(sectionModel: state.sectionModel);
              } else {
                return const SizedBox(height: AppSpace.meduim1);
              }
            },
            childCount: 1,
          ),
        );
      },
    );
  }
}

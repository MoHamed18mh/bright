import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/testimonial/cubit/testimonial_cubit.dart';
import 'package:bright/features/testimonial/cubit/testimonial_state.dart';
import 'package:bright/features/testimonial/presentation/widgets/testimonial_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTestimonial extends StatelessWidget {
  const CustomTestimonial({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonialCubit = context.read<TestimonialCubit>();

    return BlocBuilder<TestimonialCubit, TestimonialState>(
      builder: (context, state) {
        return SizedBox(
          height: AppSpace.size2,
          child: PageView.builder(
            controller: testimonialCubit.pageController,
            itemCount: testimonialCount,
            itemBuilder: (context, index) {
              return const TestimonialItem();
            },
          ),
        );
      },
    );
  }
}

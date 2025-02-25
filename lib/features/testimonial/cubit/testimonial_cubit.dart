import 'dart:async';
import 'package:bright/features/testimonial/cubit/testimonial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int testimonialCount = 4;

class TestimonialCubit extends Cubit<TestimonialState> {
  TestimonialCubit() : super(TestimonialInitial());

  PageController pageController = PageController();
  late Timer timer;
  int currentTestimonialIndex = 0;
  

  // change testimonial automatic
  void startAutoScroll() {
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (Timer timer) {
        currentTestimonialIndex =
            (currentTestimonialIndex + 1) % testimonialCount;
        pageController.animateToPage(
          currentTestimonialIndex,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  Future<void> close() {
    timer.cancel();
    pageController.dispose();
    return super.close();
  }
}

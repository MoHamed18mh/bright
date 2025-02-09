import 'dart:async';

import 'package:bright/features/testimonial/cubit/testimonial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestimonialCubit extends Cubit<TestimonialState> {
  TestimonialCubit() : super(TestimonialInitial());

  PageController pageController = PageController();
  late Timer timer;
  int currentTestimoial = 0;

  // change testimonial automatic
  void startAutoScroll() {
    timer = Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (currentTestimoial < 4) {
          currentTestimoial++;
        } else {
          currentTestimoial = 0;
        }
        pageController.animateToPage(
          currentTestimoial,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}

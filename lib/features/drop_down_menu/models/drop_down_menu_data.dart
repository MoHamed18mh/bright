import 'package:bright/core/api/dio_consumer.dart';
import 'package:bright/core/repositories/instructor_repo.dart';
import 'package:bright/features/about/presentation/views/about_view.dart';
import 'package:bright/features/contact/presentation/views/contact_view.dart';
import 'package:bright/features/course/presentation/views/course_view.dart';
import 'package:bright/features/home/presentation/views/home_view.dart';
import 'package:bright/features/instructor/cubit/instructor_cubit.dart';
import 'package:bright/features/instructor/presentation/views/instructor_view.dart';
import 'package:bright/features/testimonial/presentation/views/testimonial_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> menuHeaders = [
  'HOME',
  'COURSES',
  'INSTRUCTORS',
  'TESTIMONIAL',
  'ABOUT',
  'CONTACT',
];

List<Widget> menuBodys = [
  HomeView(),
  CourseView(),
  BlocProvider(
    create: (context) =>
        InstructorCubit(InstructorRepo(api: DioConsumer(dio: Dio())))
          ..getInstructors(),
    child: InstructorView(),
  ),
  TestimonialView(),
  AboutView(),
  ContactView(),
];

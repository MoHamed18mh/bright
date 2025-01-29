import 'package:bright/features/about/presentation/views/about_view.dart';
import 'package:bright/features/contact/presentation/views/contact_view.dart';
import 'package:bright/features/course/presentation/views/course_view.dart';
import 'package:bright/features/home/presentation/views/home_view.dart';
import 'package:bright/features/instructor/presentation/views/instructor_view.dart';
import 'package:bright/features/testimonial/presentation/views/testimonial_view.dart';
import 'package:flutter/material.dart';

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
  InstructorView(),
  TestimonialView(),
  AboutView(),
  ContactView(),
];

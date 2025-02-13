import 'package:bright/core/utils/app_space.dart';
import 'package:flutter/material.dart';

class InstructorImageWidget extends StatelessWidget {
  const InstructorImageWidget({
    super.key,
    required this.imageCover,
  });

  final String imageCover;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppSpace.maxSpace3,
        width: AppSpace.maxSpace3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpace.maxSpace3),
          image: DecorationImage(
              image: NetworkImage(
                imageCover,
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

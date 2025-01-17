import 'package:bright/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SplachView extends StatelessWidget {
  const SplachView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppStrings.appName),
      ),
    );
  }
}
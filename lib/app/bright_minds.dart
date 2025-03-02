import 'package:bright/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class BrightMinds extends StatelessWidget {
  const BrightMinds({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BrightMinds',
      routerConfig: router,
    );
  }
}

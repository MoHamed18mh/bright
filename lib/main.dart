import 'package:bright/app/bright_minds.dart';
import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const BrightMinds());
}

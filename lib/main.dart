import 'package:bright/app/bright_minds.dart';
import 'package:bright/core/database/cache_helper.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const BrightMinds());
}



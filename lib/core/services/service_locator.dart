import 'package:bright/core/database/cache_helper.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // make one vlariable of cacheHelper
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
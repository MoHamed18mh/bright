import 'package:bright/features/splach/presentation/view/splach_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplachView(),
    ),
  ],
);

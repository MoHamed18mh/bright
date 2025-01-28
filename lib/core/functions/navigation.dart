import 'package:go_router/go_router.dart';

void navigate(context, String path) {
  GoRouter.of(context).push(path);
}

void navigateReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void navigatePop(context) {
  GoRouter.of(context).pop();
}

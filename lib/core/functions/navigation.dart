import 'package:go_router/go_router.dart';

void navigate(context, String path, {Object? data}) {
  GoRouter.of(context).push(path, extra: data);
}

void navigateReplacement(context, String path, {Object? data}) {
  GoRouter.of(context).pushReplacement(path, extra: data);
}

void navigatePop(context) {
  GoRouter.of(context).pop();
}

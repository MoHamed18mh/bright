import 'package:bright/core/functions/handle_deep_link.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:go_router/go_router.dart';

String? handleRedirect(GoRouterState state) {
  // handel deep link with goRouter paths
  final String? deepLinkPath = handleDeepLink(state.uri.path);

  // build new deep link for open app with splashView
  if (deepLinkPath != null) {
    return Uri(
      path: RouteKey.splashView, // set lanunc path to open app on splash view
      queryParameters: {
        RouteKey.deepLinkPath:
            deepLinkPath, // save handled deepLinkPath in queryParameters
        ...state.uri.queryParameters, // set all other value with out changes
      },
    ).toString();
  } else {
    return null;
  }
}

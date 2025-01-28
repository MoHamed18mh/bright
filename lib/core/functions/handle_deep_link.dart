import 'package:bright/core/routes/deep_links_key.dart';
import 'package:bright/core/routes/route_key.dart';

String? handleDeepLink(String deepLink) {
  final Map<String, String> deepLinkRoutes = {
    DeepLinkPathKey.verify: RouteKey.launch,
  };

  return deepLinkRoutes[deepLink];
}

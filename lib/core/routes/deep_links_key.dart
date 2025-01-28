abstract class DeepLinksKey {
  static const String verifyDeepLink =
      'https://brightminds.runasp.net${DeepLinkPathKey.verify}';
  static const String forgotPasswordDeepLink =
      'https://brightminds.runasp.net${DeepLinkPathKey.resetPassword}';
}

abstract class DeepLinkPathKey {
  static const String verify = '/verify';
  static const String resetPassword = '/resetpassword';
}

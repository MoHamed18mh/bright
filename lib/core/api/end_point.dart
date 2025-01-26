abstract class EndPoint {
  static final String baseUrl = 'https://brightminds.runasp.net';
  static final String login = '/api/Account/login';
}

abstract class ApiKey {
  static final String statusCode = 'statusCode',
      message = 'message',
      errors = 'errors',
      token = 'token',
      user = 'user',
      email = 'email',
      displayName = 'displayName',
      mobile = 'mobile',
      id = 'id',
      imageCover = 'imageCover',
      walletBalance = 'waletBalance';
}

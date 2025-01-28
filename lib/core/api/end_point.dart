abstract class EndPoint {
  static final String baseUrl = 'https://brightminds.runasp.net';
  static final String login = '/api/Account/login';
  static final String register = '/api/Account/register';
  static final String authenticate = '/api/Account/authnticate-email';
  static final String confirmEmail = '/api/Account/confirm-email';
  static final String forgotPassword = '/api/Account/forget-password';
  static final String resetPassword = '/api/Account/reset-password';
}

abstract class ApiKey {
  static final String statusCode = 'statusCode',
      message = 'message',
      errors = 'errors',
      user = 'user',
      // login key
      token = 'token',
      email = 'email',
      password = 'password',
      confirmPassword = 'confirmPassword',
      displayName = 'displayName',
      mobile = 'mobile',
      id = 'id',
      imageCover = 'imageCover',
      walletBalance = 'waletBalance',
      // register key
      rFirstName = 'FirstName',
      rLastName = 'LastName',
      rEmail = 'Email',
      rMobile = 'Mobile',
      rPassword = 'Password',
      rConfirmPassword = 'ConfirmPassword',
      clientUrl = 'clientUrl',
      // id key in token
      idSchema =
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';
}

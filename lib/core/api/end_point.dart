abstract class EndPoint {
  static final String baseUrl = 'https://brightminds.runasp.net';
  static final String postLogin = '/api/Account/login';
  static final String postRegister = '/api/Account/register';
  static final String postAuthenticateEmail = '/api/Account/authnticate-email';
  static final String postConfirmEmail = '/api/Account/confirm-email';
  static final String postForgotPassword = '/api/Account/forget-password';
  static final String postResetPassword = '/api/Account/reset-password';
  static final String getInstructors = '/api/Instructor';
  static final String getCategories = '/api/Category';
  static final String getCourses = '/api/Course';
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
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier',

      // instructors key
      success = 'success',
      data = 'data',
      pageSize = 'pageSize',
      count = 'count',
      pageIndex = 'pageIndex',
      qualifications = 'qualifications',
      userId = 'userId',
      jobTitle = 'jobTitle',
      name = 'name',
      items = 'items',

      // courses keys
      sections = 'sections',
      updatedDate = 'updatedDate',
      createdDate = 'createdDate',
      pictureUrl = 'pictureUrl',
      instructorName = 'instructorName',
      price = 'price',
      description = 'description';
}

abstract class EndPoint {
  static const String baseUrl = 'https://brightminds.runasp.net';
  static const String postLogin = '/api/Account/login';
  static const String postRegister = '/api/Account/register';
  static const String postAuthenticateEmail = '/api/Account/authnticate-email';
  static const String postConfirmEmail = '/api/Account/confirm-email';
  static const String postForgotPassword = '/api/Account/forget-password';
  static const String postResetPassword = '/api/Account/reset-password';
  static const String getInstructors = '/api/Instructor';
  static const String getCourses = '/api/Course';
  static String getSection(int courseId) {
    return '/api/Section/course/$courseId';
  }
  static String getVideo(int sectionId) {
    return '/api/Video/section/$sectionId';
  }
  static String getUser(String userId) {
    return '/api/Account/$userId';
  }
}

abstract class ApiKey {
  static const String statusCode = 'statusCode',
      message = 'message',
      errors = 'errors',
      user = 'user',
      token = 'token',
      email = 'email',
      password = 'password',
      confirmPassword = 'confirmPassword',
      displayName = 'displayName',
      mobile = 'mobile',
      id = 'id',
      imageCover = 'imageCover',
      walletBalance = 'waletBalance',
      rFirstName = 'FirstName',
      rLastName = 'LastName',
      rEmail = 'Email',
      rMobile = 'Mobile',
      rPassword = 'Password',
      rConfirmPassword = 'ConfirmPassword',
      clientUrl = 'clientUrl',
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
      sections = 'sections',
      updatedDate = 'updatedDate',
      createdDate = 'createdDate',
      pictureUrl = 'pictureUrl',
      instructorName = 'instructorName',
      price = 'price',
      courseId = 'courseId',
      order = 'order',
      description = 'description',
      sectionId = 'sectionId',
      sectionName = 'sectionName',
      videoUrl = 'videoUrl',
      coverUrl = 'coverUrl',
      duration = 'duration',
      profileMess = 'messaget',
      idSchema =
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';
}

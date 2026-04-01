class EndPoints {
  static String baseUrl = "https://api.badihy.com/api/";
  static String login = "auth/login";
  static String googleAuth = "auth/firebase-login";
  static String forgetPassword = "auth/forgot-password";
  static String resetPassword = "auth/reset-password";
  static String register = "user";
  static String getAllCourses = "courses";
  static String getAllCategories = "categories";
  static String updateUser(id) {
    return "user/$id";
  }

  static String deleteUser(id) {
    return "user/$id";
  }

  static String getCourseDetails(id) {
    return "courses/$id/chapters/lessons";
  }
}

class ApiKey {
  static String id = "_id";
  static String fullName = "fullName";
  static String username = "username";
  static String email = "email";
  static String password = "password";
  static String passwordConfirm = "passwordConfirm";
  static String phone = "phone";
  static String newPassword = "newPassword";
  static String confirmNewPassword = "confirmNewPassword";
  static String token = "token";
  static String uid = "uid";
  static String success = "success";
  static String message = "message";
  static String data = "data";
}

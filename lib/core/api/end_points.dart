class EndPoints {
  static String baseUrl = "https://api.badihy.com/api/";
  static String login = "auth/login";
  static String refreshToken = "auth/refresh";
  static String googleAuth = "auth/firebase-login";
  static String forgetPassword = "auth/forgot-password";
  static String resetPassword = "auth/reset-password";
  static String register = "user";
  static String getAllCourses = "courses";
  static String getAllCategories = "categories";
  static String addToBookmarks = "bookmarks";
  static String reportProblem = "reports";

  static String updateUser(id) {
    return "user/$id";
  }

  static String deleteUser(id) {
    return "user/$id";
  }

  static String getCourseDetails(id) {
    return "courses/$id/chapters/lessons";
  }

  static String enrollUserInCourse(courseId) {
    return "courses/$courseId/enroll";
  }

  static String getAllBookmarks(id) {
    return "bookmarks/user/$id";
  }

  static String deleteBookmark(userId, courseId) {
    return "bookmarks/$userId/$courseId";
  }
}

class ApiKey {
  static String id = "_id";
  static String fullName = "fullName";
  static String name = "name";
  static String username = "username";
  static String email = "email";
  static String password = "password";
  static String passwordConfirm = "passwordConfirm";
  static String phone = "phone";
  static String newPassword = "newPassword";
  static String confirmNewPassword = "confirmNewPassword";
  static String token = "token";
  static String refreshToken = "refreshToken";
  static String uid = "uid";
  static String success = "success";
  static String message = "message";
  static String data = "data";
  static String userId = "userId";
  static String courseId = "courseId";
  static String subject = "subject";
  static String type = "type";
}

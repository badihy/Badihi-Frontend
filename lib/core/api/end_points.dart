class EndPoints {
  static const String baseUrl = "https://api.badihy.com/api/";
  static const String login = "auth/login";
  static const String refreshToken = "auth/refresh";
  static const String googleAuth = "auth/mobile";
  static const String googleAuthCallback = "auth/google/callback";
  static const String forgetPassword = "auth/forgot-password";
  static const String resetPassword = "auth/reset-password";
  static const String register = "user";
  static const String getAllCourses = "courses";
  static const String getAllEnrolledCourses = "courses/enrolled";
  static const String getAllCategories = "categories";
  static const String addToBookmarks = "bookmarks";
  static const String reportProblem = "reports";

  static String updateUser(id) {
    return "user/$id";
  }

  static String deleteUser(id) {
    return "user/$id";
  }

  static String updateUserProfile(id) {
    return "user/$id/profile-image";
  }

  static String getCourseDetails(id) {
    return "courses/$id";
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
  static const String id = "_id";
  static const String fullName = "fullName";
  static const String name = "name";
  static const String username = "username";
  static const String email = "email";
  static const String password = "password";
  static const String passwordConfirm = "passwordConfirm";
  static const String phone = "phone";
  static const String newPassword = "newPassword";
  static const String confirmNewPassword = "confirmNewPassword";
  static const String token = "token";
  static const String refreshToken = "refreshToken";
  static const String uid = "uid";
  static const String success = "success";
  static const String message = "message";
  static const String data = "data";
  static const String userId = "userId";
  static const String courseId = "courseId";
  static const String subject = "subject";
  static const String type = "type";
  static const String imageUrl = "imageUrl";
  static const String profileImage = "profileImage";
  static const String idToken = "idToken";
}

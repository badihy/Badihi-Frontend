extension ExtString on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool get isValidName {
    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF ]{3,30}$');
    return nameRegex.hasMatch(this);
  }

  bool get isValidPassword {
    return length >= 8;
  }
}

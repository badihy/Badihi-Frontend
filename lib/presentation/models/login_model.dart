class LoginModel {
  final LoginData data;
  final int statusCode;
  final DateTime timestamp;

  LoginModel({
    required this.data,
    required this.statusCode,
    required this.timestamp,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: LoginData.fromJson(json['data']),
      statusCode: json['statusCode'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'statusCode': statusCode,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class LoginData {
  final String token;
  final String refreshToken;
  final User user;

  LoginData({
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
      refreshToken: json['refreshToken'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'refreshToken': refreshToken,
      'user': user.toJson(),
    };
  }
}

class User {
  final String id;
  final String username;
  final String email;
  final String phone;
  final bool isVerified;
  final String fullName;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.isVerified,
    required this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      isVerified: json['isVerified'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'isVerified': isVerified,
      'fullName': fullName,
    };
  }
}

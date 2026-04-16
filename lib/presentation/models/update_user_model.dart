// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
  final Data? data;
  final int? statusCode;
  final DateTime? timestamp;

  UpdateUserModel({
    this.data,
    this.statusCode,
    this.timestamp,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "statusCode": statusCode,
        "timestamp": timestamp?.toIso8601String(),
      };
}

class Data {
  final String? id;
  final String? username;
  final String? fullName;
  final String? email;
  final String? password;
  final String? phone;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? verificationToken;
  final DateTime? verificationTokenExpires;
  final String? refreshToken;

  Data({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.password,
    this.phone,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.verificationToken,
    this.verificationTokenExpires,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        username: json["username"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        isVerified: json["isVerified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        verificationToken: json["verificationToken"],
        verificationTokenExpires: json["verificationTokenExpires"] == null
            ? null
            : DateTime.parse(json["verificationTokenExpires"]),
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "fullName": fullName,
        "email": email,
        "password": password,
        "phone": phone,
        "isVerified": isVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "verificationToken": verificationToken,
        "verificationTokenExpires": verificationTokenExpires?.toIso8601String(),
        "refreshToken": refreshToken,
      };
}

import 'package:badihi/core/api/end_points.dart';

class ErrorModel {
  final bool success;
  final String message;
  final dynamic data;

  ErrorModel({
    required this.success,
    required this.message,
    this.data,
  });

  // Factory method to create an instance from JSON
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      success: json[ApiKey.success] ?? false,
      message: json[ApiKey.message] ?? "",
      data: json[ApiKey.data],
    );
  }

  // Convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": data,
    };
  }
}

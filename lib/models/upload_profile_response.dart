// To parse this JSON data, do
//
//     final uploadProfileResponse = uploadProfileResponseFromMap(jsonString);

import 'dart:convert';

class UploadProfileResponse {
  UploadProfileResponse({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory UploadProfileResponse.fromJson(String str) =>
      UploadProfileResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadProfileResponse.fromMap(Map<String, dynamic> json) =>
      UploadProfileResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

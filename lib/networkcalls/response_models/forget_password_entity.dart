// To parse this JSON data, do
//
//     final forgetPasswordEntity = forgetPasswordEntityFromMap(jsonString);

import 'dart:convert';

class ForgetPasswordEntity {
  ForgetPasswordEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory ForgetPasswordEntity.fromJson(String str) =>
      ForgetPasswordEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForgetPasswordEntity.fromMap(Map<String, dynamic> json) =>
      ForgetPasswordEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

// To parse this JSON data, do
//
//     final changePasswordEntity = changePasswordEntityFromMap(jsonString);

import 'dart:convert';

class ChangePasswordEntity {
  ChangePasswordEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory ChangePasswordEntity.fromJson(String str) =>
      ChangePasswordEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChangePasswordEntity.fromMap(Map<String, dynamic> json) =>
      ChangePasswordEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

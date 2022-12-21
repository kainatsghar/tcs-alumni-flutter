// To parse this JSON data, do
//
//     final verifyPhoneEntity = verifyPhoneEntityFromMap(jsonString);

import 'dart:convert';

class VerifyPhoneEntity {
  VerifyPhoneEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory VerifyPhoneEntity.fromJson(String str) =>
      VerifyPhoneEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyPhoneEntity.fromMap(Map<String, dynamic> json) =>
      VerifyPhoneEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

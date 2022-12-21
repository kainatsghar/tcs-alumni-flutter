// To parse this JSON data, do
//
//     final ReferEntity = ReferEntityFromMap(jsonString);

import 'dart:convert';

class ReferEntity {
  ReferEntity({
    this.userId,
    this.success,
    this.message,
  });

  String? userId;
  int? success;
  String? message;

  factory ReferEntity.fromJson(String str) =>
      ReferEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReferEntity.fromMap(Map<String, dynamic> json) => ReferEntity(
        userId: json["user_id"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "success": success,
        "message": message,
      };
}

// To parse this JSON data, do
//
//     final bossForgetEntity = bossForgetEntityFromMap(jsonString);

import 'dart:convert';

class BossForgetEntity {
  BossForgetEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory BossForgetEntity.fromJson(String str) =>
      BossForgetEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BossForgetEntity.fromMap(Map<String, dynamic> json) =>
      BossForgetEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

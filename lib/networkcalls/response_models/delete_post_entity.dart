// To parse this JSON data, do
//
//     final deletePostEntity = deletePostEntityFromMap(jsonString);

import 'dart:convert';

class DeletePostEntity {
  DeletePostEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory DeletePostEntity.fromJson(String str) =>
      DeletePostEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeletePostEntity.fromMap(Map<String, dynamic> json) =>
      DeletePostEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

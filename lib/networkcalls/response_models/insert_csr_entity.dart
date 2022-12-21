// To parse this JSON data, do
//
//     final insertCsrEntity = insertCsrEntityFromMap(jsonString);

import 'dart:convert';

class InsertCsrEntity {
  InsertCsrEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory InsertCsrEntity.fromJson(String str) =>
      InsertCsrEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InsertCsrEntity.fromMap(Map<String, dynamic> json) => InsertCsrEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

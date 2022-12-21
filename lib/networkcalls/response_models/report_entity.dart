// To parse this JSON data, do
//
//     final reportEntity = reportEntityFromMap(jsonString);

import 'dart:convert';

class ReportEntity {
  ReportEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory ReportEntity.fromJson(String str) =>
      ReportEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportEntity.fromMap(Map<String, dynamic> json) => ReportEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

// To parse this JSON data, do
//
//     final editLinkedInEntity = editLinkedInEntityFromMap(jsonString);

import 'dart:convert';

class EditLinkedInEntity {
  EditLinkedInEntity({
    this.result,
    this.success,
    this.message,
  });

  bool? result;
  int? success;
  String? message;

  factory EditLinkedInEntity.fromJson(String str) =>
      EditLinkedInEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditLinkedInEntity.fromMap(Map<String, dynamic> json) =>
      EditLinkedInEntity(
        result: json["result"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "success": success,
        "message": message,
      };
}

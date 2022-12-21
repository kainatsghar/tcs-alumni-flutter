// To parse this JSON data, do
//
//     final editCityEntity = editCityEntityFromMap(jsonString);

import 'dart:convert';

class EditCityEntity {
  EditCityEntity({
    this.result,
    this.success,
    this.message,
  });

  bool? result;
  int? success;
  String? message;

  factory EditCityEntity.fromJson(String str) =>
      EditCityEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditCityEntity.fromMap(Map<String, dynamic> json) => EditCityEntity(
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

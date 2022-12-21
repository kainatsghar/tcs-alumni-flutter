// To parse this JSON data, do
//
//     final addStoryEntity = addStoryEntityFromMap(jsonString);

import 'dart:convert';

class AddStoryEntity {
  AddStoryEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory AddStoryEntity.fromJson(String str) =>
      AddStoryEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddStoryEntity.fromMap(Map<String, dynamic> json) => AddStoryEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

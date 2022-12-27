// To parse this JSON data, do
//
//     final seenStoryEntity = seenStoryEntityFromMap(jsonString);

import 'dart:convert';

class SeenStoryEntity {
  SeenStoryEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory SeenStoryEntity.fromJson(String str) =>
      SeenStoryEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeenStoryEntity.fromMap(Map<String, dynamic> json) => SeenStoryEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

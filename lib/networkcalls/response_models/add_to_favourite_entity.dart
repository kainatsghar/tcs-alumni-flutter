// To parse this JSON data, do
//
//     final addFavouriteEntity = addFavouriteEntityFromMap(jsonString);

import 'dart:convert';

class AddFavouriteEntity {
  AddFavouriteEntity({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory AddFavouriteEntity.fromJson(String str) =>
      AddFavouriteEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddFavouriteEntity.fromMap(Map<String, dynamic> json) =>
      AddFavouriteEntity(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}

// To parse this JSON data, do
//
//     final uploadFileEntity = uploadFileEntityFromMap(jsonString);

import 'dart:convert';

class UploadFileEntity {
  UploadFileEntity({
    this.success,
    this.message,
    this.images,
  });

  int? success;
  String? message;
  String? images;

  factory UploadFileEntity.fromJson(String str) => UploadFileEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadFileEntity.fromMap(Map<String, dynamic> json) => UploadFileEntity(
    success: json["success"],
    message: json["message"],
    images: json["images"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "images": images,
  };
}

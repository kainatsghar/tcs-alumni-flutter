// To parse this JSON data, do
//
//     final uploadProdImageEntity = uploadProdImageEntityFromMap(jsonString);

import 'dart:convert';

class UploadProdImageEntity {
  UploadProdImageEntity({
    this.success,
    this.message,
    this.image,
    this.ext,
  });

  int? success;
  String? message;
  String? image;
  String? ext;

  factory UploadProdImageEntity.fromJson(String str) =>
      UploadProdImageEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadProdImageEntity.fromMap(Map<String, dynamic> json) =>
      UploadProdImageEntity(
        success: json["success"],
        message: json["message"],
        image: json["images"],
        ext: json["ext"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "images": image,
        "ext": ext,
      };
}

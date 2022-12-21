// To parse this JSON data, do
//
//     final uploadImageResponse = uploadImageResponseFromMap(jsonString);

import 'dart:convert';

class UploadImageResponse {
  UploadImageResponse({
    this.success,
    this.message,
    this.image,
  });

  int? success;
  String? message;
  String? image;

  factory UploadImageResponse.fromJson(String str) =>
      UploadImageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadImageResponse.fromMap(Map<String, dynamic> json) =>
      UploadImageResponse(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "image": image == null ? null : image,
      };
}

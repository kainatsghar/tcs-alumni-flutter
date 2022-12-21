// To parse this JSON data, do
//
//     final applyForCardModel = applyForCardModelFromMap(jsonString);

import 'dart:convert';

class ApplyForCardModel {
  ApplyForCardModel({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory ApplyForCardModel.fromJson(String str) => ApplyForCardModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApplyForCardModel.fromMap(Map<String, dynamic> json) => ApplyForCardModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}

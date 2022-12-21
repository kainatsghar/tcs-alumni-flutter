// To parse this JSON data, do
//
//     final categoriesEntity = categoriesEntityFromMap(jsonString);

import 'dart:convert';

import 'package:iobm/local_db/local_db.dart';

class CategoriesEntity {
  CategoriesEntity({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  List<DBProductCategorie>? result;

  factory CategoriesEntity.fromJson(String str) =>
      CategoriesEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesEntity.fromMap(Map<String, dynamic> json) =>
      CategoriesEntity(
        success: json["success"],
        message: json["message"],
        result: List<DBProductCategorie>.from(
            json["result"].map((x) => DBProductCategorie.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

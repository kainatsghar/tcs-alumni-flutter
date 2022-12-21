// To parse this JSON data, do
//
//     final productsEntity = productsEntityFromMap(jsonString);

import 'dart:convert';

import 'package:iobm/local_db/local_db.dart';

class ProductsEntity {
  ProductsEntity({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  List<DBProduct>? result;

  factory ProductsEntity.fromJson(String str) =>
      ProductsEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsEntity.fromMap(Map<String, dynamic> json) => ProductsEntity(
        success: json["success"],
        message: json["message"],
        result: List<DBProduct>.from(
            json["result"].map((x) => DBProduct.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

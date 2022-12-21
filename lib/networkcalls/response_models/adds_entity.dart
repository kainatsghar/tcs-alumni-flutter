// To parse this JSON data, do
//
//     final addsEntity = addsEntityFromMap(jsonString);

import 'dart:convert';

class AddsEntity {
  AddsEntity({
    this.success,
    this.banners,
  });

  int? success;
  Banners? banners;

  factory AddsEntity.fromJson(String str) =>
      AddsEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddsEntity.fromMap(Map<String, dynamic> json) => AddsEntity(
        success: json["success"],
        banners: Banners.fromMap(json["banners"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "banners": banners?.toMap(),
      };
}

class Banners {
  Banners({
    this.image,
    this.type,
  });

  String? image;
  String? type;

  factory Banners.fromJson(String str) => Banners.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Banners.fromMap(Map<String, dynamic> json) => Banners(
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "type": type,
      };
}

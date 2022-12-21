// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromMap(jsonString);

import 'dart:convert';

class ProductDetailsModel {
  ProductDetailsModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  List<Result>? result;

  factory ProductDetailsModel.fromJson(String str) =>
      ProductDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromMap(Map<String, dynamic> json) =>
      ProductDetailsModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        result: json["result"] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "result": result == null
            ? null
            : List<dynamic>.from(result!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.productName,
    this.productPrice,
    this.category,
    this.cityName,
    this.productQty,
    this.productDesc,
    this.isActive,
    this.addedBy,
    this.dueDate,
    this.isAnonymous,
    this.isPremium,
    this.postedBy,
    this.coverImage,
  });

  int? id;
  String? productName;
  String? productPrice;
  String? category;
  String? cityName;
  String? productQty;
  String? productDesc;
  String? isActive;
  int? addedBy;
  String? dueDate;
  String? isAnonymous;
  String? isPremium;
  String? postedBy;
  List<CoverImage>? coverImage;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productPrice:
            json["product_price"] == null ? null : json["product_price"],
        category: json["category"] == null ? null : json["category"],
        cityName: json["city_name"] == null ? null : json["city_name"],
        productQty: json["product_qty"] == null ? null : json["product_qty"],
        productDesc: json["product_desc"] == null ? null : json["product_desc"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        addedBy: json["added_by"] == null ? null : json["added_by"],
        dueDate: json["due_date"] == null ? null : json["due_date"],
        isAnonymous: json["is_anonymous"] == null ? null : json["is_anonymous"],
        isPremium: json["is_premium"] == null ? null : json["is_premium"],
        postedBy: json["posted_by"] == null ? null : json["posted_by"],
        coverImage: json["cover_image"] == null
            ? null
            : List<CoverImage>.from(
                json["cover_image"].map((x) => CoverImage.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "product_name": productName == null ? null : productName,
        "product_price": productPrice == null ? null : productPrice,
        "category": category == null ? null : category,
        "city_name": cityName == null ? null : cityName,
        "product_qty": productQty == null ? null : productQty,
        "product_desc": productDesc == null ? null : productDesc,
        "is_active": isActive == null ? null : isActive,
        "added_by": addedBy == null ? null : addedBy,
        "due_date": dueDate == null ? null : dueDate,
        "is_anonymous": isAnonymous == null ? null : isAnonymous,
        "is_premium": isPremium == null ? null : isPremium,
        "posted_by": postedBy == null ? null : postedBy,
        "cover_image": coverImage == null
            ? null
            : List<dynamic>.from(coverImage!.map((x) => x.toMap())),
      };
}

class CoverImage {
  CoverImage({
    this.id,
    this.productId,
    this.productMedia,
    this.createdAt,
    this.type,
  });

  int? id;
  int? productId;
  String? productMedia;
  String? createdAt;
  String? type;

  factory CoverImage.fromJson(String str) =>
      CoverImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoverImage.fromMap(Map<String, dynamic> json) => CoverImage(
        id: json["id"],
        productId: json["product_id"],
        productMedia: json["product_media"],
        createdAt: json["created_at"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_id": productId == null ? null : productId,
        "product_media": productMedia == null ? null : productMedia,
        "created_at": createdAt == null ? null : createdAt,
        "type": type,
      };
}

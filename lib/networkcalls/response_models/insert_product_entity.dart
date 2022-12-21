// To parse this JSON data, do
//
//     final insertProductEntity = insertProductEntityFromMap(jsonString);

import 'dart:convert';

class InsertProductEntity {
  InsertProductEntity({
    this.success,
    this.message,
    this.productPost,
  });

  int? success;
  String? message;
  ProductPost? productPost;

  factory InsertProductEntity.fromJson(String str) =>
      InsertProductEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InsertProductEntity.fromMap(Map<String, dynamic> json) =>
      InsertProductEntity(
        success: json["success"],
        message: json["message"],
        productPost: ProductPost.fromMap(json["product_post"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "product_post": productPost!.toMap(),
      };
}

class ProductPost {
  ProductPost({
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
    this.image,
  });

  int? id;
  String? productName;
  String? productPrice;
  String? category;
  String? cityName;
  String? productQty;
  String? productDesc;
  String? isActive;
  String? addedBy;
  String? dueDate;
  String? isAnonymous;
  String? isPremium;
  String? postedBy;
  List<CoverImage>? coverImage;
  String? image;

  factory ProductPost.fromJson(String str) =>
      ProductPost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductPost.fromMap(Map<String, dynamic> json) => ProductPost(
        id: json["id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        category: json["category"],
        cityName: json["city_name"],
        productQty: json["product_qty"],
        productDesc: json["product_desc"],
        isActive: json["is_active"],
        addedBy: json["added_by"],
        dueDate: json["due_date"],
        isAnonymous: json["is_anonymous"],
        isPremium: json["is_premium"],
        postedBy: json["posted_by"],
        coverImage: List<CoverImage>.from(
            json["cover_image"].map((x) => CoverImage.fromMap(x))),
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_name": productName,
        "product_price": productPrice,
        "category": category,
        "city_name": cityName,
        "product_qty": productQty,
        "product_desc": productDesc,
        "is_active": isActive,
        "added_by": addedBy,
        "due_date": dueDate,
        "is_anonymous": isAnonymous,
        "is_premium": isPremium,
        "posted_by": postedBy,
        "cover_image": List<dynamic>.from(coverImage!.map((x) => x.toMap())),
        "image": image,
      };
}

class CoverImage {
  CoverImage({
    this.id,
    this.productId,
    this.productMedia,
    this.createdAt,
  });

  int? id;
  int? productId;
  String? productMedia;
  String? createdAt;

  factory CoverImage.fromJson(String str) =>
      CoverImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoverImage.fromMap(Map<String, dynamic> json) => CoverImage(
        id: json["id"],
        productId: json["product_id"],
        productMedia: json["product_media"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_id": productId,
        "product_media": productMedia,
        "created_at": createdAt,
      };
}

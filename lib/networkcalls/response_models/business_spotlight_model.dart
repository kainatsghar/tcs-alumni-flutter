// To parse this JSON data, do
//
//     final businessSpotLightModel = businessSpotLightModelFromMap(jsonString);

import 'dart:convert';

class BusinessSpotLightModel {
  BusinessSpotLightModel({
    this.success,
    this.message,
    this.businessSpotlight,
  });

  int? success;
  String? message;
  List<BusinessSpotlight>? businessSpotlight;

  factory BusinessSpotLightModel.fromJson(String str) => BusinessSpotLightModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessSpotLightModel.fromMap(Map<String, dynamic> json) => BusinessSpotLightModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    businessSpotlight: json["business_spotlight"] == null ? null : List<BusinessSpotlight>.from(json["business_spotlight"].map((x) => BusinessSpotlight.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "business_spotlight": businessSpotlight == null ? null : List<dynamic>.from(businessSpotlight!.map((x) => x.toMap())),
  };
}

class BusinessSpotlight {
  BusinessSpotlight({
    this.id,
    this.isDeleted,
    this.banner,
    this.createdBy,
    this.updatedBy,
    this.sortingOrder,
    this.updatedAt,
    this.createdAt,
    this.clickUrl,
  });

  int? id;
  String? isDeleted;
  String? banner;
  int? createdBy;
  int? updatedBy;
  int? sortingOrder;
  String? updatedAt;
  String? createdAt;
  String? clickUrl;

  factory BusinessSpotlight.fromJson(String str) => BusinessSpotlight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessSpotlight.fromMap(Map<String, dynamic> json) => BusinessSpotlight(
    id: json["id"] == null ? null : json["id"],
    isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
    banner: json["banner"] == null ? null : json["banner"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    updatedBy: json["updated_by"] == null ? null : json["updated_by"],
    sortingOrder: json["sorting_order"] == null ? null : json["sorting_order"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    clickUrl: json["click_url"] == null ? null : json["click_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "is_deleted": isDeleted == null ? null : isDeleted,
    "banner": banner == null ? null : banner,
    "created_by": createdBy == null ? null : createdBy,
    "updated_by": updatedBy == null ? null : updatedBy,
    "sorting_order": sortingOrder == null ? null : sortingOrder,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "click_url": clickUrl == null ? null : clickUrl,
  };
}

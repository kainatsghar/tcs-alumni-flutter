// To parse this JSON data, do
//
//     final postWhoReactModel = postWhoReactModelFromMap(jsonString);

import 'dart:convert';

class PostWhoReactModel {
  PostWhoReactModel({
    this.success,
    this.message,
    this.likesCount,
    this.data,
  });

  int? success;
  String? message;
  int? likesCount;
  List<Datum>? data;

  factory PostWhoReactModel.fromJson(String str) => PostWhoReactModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostWhoReactModel.fromMap(Map<String, dynamic> json) => PostWhoReactModel(
    success: json["success"],
    message: json["message"],
    likesCount: json["likes_count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "likes_count": likesCount,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.postId,
    this.email,
    this.dataRaction,
    this.firstName,
    this.lastName,
    this.image,
  });

  int? id;
  int? userId;
  int? postId;
  String? email;
  String? dataRaction;
  String? firstName;
  String? lastName;
  String? image;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    email: json["email"],
    dataRaction: json["data_raction"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "email": email,
    "data_raction": dataRaction,
    "first_name": firstName,
    "last_name": lastName,
    "image": image,
  };
}

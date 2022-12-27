// To parse this JSON data, do
//
//     final seenByEntity = seenByEntityFromMap(jsonString);

import 'dart:convert';

class SeenByEntity {
  SeenByEntity({
    this.success,
    this.message,
    this.user,
  });

  int? success;
  String? message;
  List<User>? user;

  factory SeenByEntity.fromJson(String str) =>
      SeenByEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeenByEntity.fromMap(Map<String, dynamic> json) => SeenByEntity(
        success: json["success"],
        message: json["message"],
        user: List<User>.from(json["user"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "user": List<dynamic>.from(user!.map((x) => x.toMap())),
      };
}

class User {
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.userImage,
  });

  int? userId;
  String? firstName;
  String? lastName;
  String? userImage;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
      };
}

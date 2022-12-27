// // To parse this JSON data, do
// //
// //     final timelineStoriesEntity = timelineStoriesEntityFromMap(jsonString);
//
// import 'dart:convert';
//
// import 'package:iobm/local_db/local_db.dart';
//
// class TimelineStoriesEntity {
//   TimelineStoriesEntity({
//     this.success,
//     this.message,
//     this.stories,
//   });
//
//   int? success;
//   String? message;
//   List<DBStorie>? stories;
//
//   factory TimelineStoriesEntity.fromJson(String str) =>
//       TimelineStoriesEntity.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory TimelineStoriesEntity.fromMap(Map<String, dynamic> json) =>
//       TimelineStoriesEntity(
//         success: json["success"],
//         message: json["message"],
//         stories: List<DBStorie>.from(
//             json["stories"].map((x) => DBStorie.fromJson(x))),
//       );
//
//   Map<String, dynamic> toMap() => {
//         "success": success,
//         "message": message,
//         "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
//       };
// }
//
// class Story {
//   Story({
//     this.id,
//     this.storyImage,
//     this.addedBy,
//     this.mediaType,
//     this.createdAt,
//     this.updatedAt,
//     this.seenBy,
//   });
//
//   int? id;
//   String? storyImage;
//   int? addedBy;
//   String? mediaType;
//   String? createdAt;
//   String? updatedAt;
//   List<SeenBy>? seenBy;
//
//   factory Story.fromJson(String str) => Story.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Story.fromMap(Map<String, dynamic> json) => Story(
//         id: json["id"],
//         storyImage: json["story_image"],
//         addedBy: json["added_by"],
//         mediaType: json["media_type"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         seenBy:
//             List<SeenBy>.from(json["seen_by"].map((x) => SeenBy.fromMap(x))),
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "story_image": storyImage,
//         "added_by": addedBy,
//         "media_type": mediaType,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "seen_by": List<dynamic>.from(seenBy!.map((x) => x.toMap())),
//       };
// }
//
// class SeenBy {
//   SeenBy({
//     this.firstName,
//     this.lastName,
//     this.userImage,
//   });
//
//   String? firstName;
//   String? lastName;
//   String? userImage;
//
//   factory SeenBy.fromJson(String str) => SeenBy.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory SeenBy.fromMap(Map<String, dynamic> json) => SeenBy(
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         userImage: json["user_image"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "first_name": firstName,
//         "last_name": lastName,
//         "user_image": userImage,
//       };
// }

// To parse this JSON data, do
//
//     final incomeStatementModel = incomeStatementModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final timelineStoriesEntity = timelineStoriesEntityFromJson(jsonString);

import 'dart:convert';

class TimelineStoriesEntity {
  TimelineStoriesEntity({
    this.success,
    this.message,
    this.data,
  });

  int? success;
  String? message;
  List<Datum>? data;

  factory TimelineStoriesEntity.fromRawJson(String str) => TimelineStoriesEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimelineStoriesEntity.fromJson(Map<String, dynamic> json) => TimelineStoriesEntity(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.addedBy,
    this.stories,
    this.name,
    this.userImage,
    this.devices
  });

  int? id;
  int? addedBy;
  List<Story>? stories;
  List<Device>? devices;
  String? name;
  String? userImage;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    addedBy: json["added_by"],
    stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
    name: json["name"],
    userImage: json["user_image"],
    devices:
    List<Device>.from(json["devices"].map((x) => Device.fromMap(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy,
    "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
    "name": name,
    "user_image": userImage,
    "devices": List<dynamic>.from(devices!.map((x) => x.toMap())),
  };
}

class Story {
  Story({
    this.id,
    this.mediaType,
    this.storyImage,
    this.updatedAt,
    this.link,
    this.storyTime,
  });

  int? id;
  String? mediaType;
  String? storyImage;
  String? link;
  DateTime? updatedAt;
  DateTime? storyTime;

  factory Story.fromRawJson(String str) => Story.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["id"],
    mediaType: json["media_type"],
    storyImage: json["story_image"],
    link: json["link"],
    updatedAt: DateTime.parse(json["updated_at"]),
    storyTime: DateTime.parse(json["storyTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaType,
    "story_image": storyImage,
    "link": link,
    "updated_at": updatedAt!.toIso8601String(),
    "storyTime": storyTime!.toIso8601String(),
  };
}

class Device {
  Device({
    this.id,
    this.userId,
    this.token,
    this.status,
  });

  String? id;
  String? userId;
  String? token;
  String? status;

  factory Device.fromJson(String str) => Device.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Device.fromMap(Map<String, dynamic> json) => Device(
    id: json["id"],
    userId: json["user_id"],
    token: json["token"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "token": token,
    "status": status,
  };
}
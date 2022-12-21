// To parse this JSON data, do
//
//     final timelineStoriesEntity = timelineStoriesEntityFromMap(jsonString);

import 'dart:convert';

import 'package:iobm/local_db/local_db.dart';

class TimelineStoriesEntity {
  TimelineStoriesEntity({
    this.success,
    this.message,
    this.stories,
  });

  int? success;
  String? message;
  List<DBStorie>? stories;

  factory TimelineStoriesEntity.fromJson(String str) =>
      TimelineStoriesEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TimelineStoriesEntity.fromMap(Map<String, dynamic> json) =>
      TimelineStoriesEntity(
        success: json["success"],
        message: json["message"],
        stories: List<DBStorie>.from(
            json["stories"].map((x) => DBStorie.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
      };
}

class Story {
  Story({
    this.id,
    this.storyImage,
    this.addedBy,
    this.mediaType,
    this.createdAt,
    this.updatedAt,
    this.seenBy,
  });

  int? id;
  String? storyImage;
  int? addedBy;
  String? mediaType;
  String? createdAt;
  String? updatedAt;
  List<SeenBy>? seenBy;

  factory Story.fromJson(String str) => Story.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Story.fromMap(Map<String, dynamic> json) => Story(
        id: json["id"],
        storyImage: json["story_image"],
        addedBy: json["added_by"],
        mediaType: json["media_type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        seenBy:
            List<SeenBy>.from(json["seen_by"].map((x) => SeenBy.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "story_image": storyImage,
        "added_by": addedBy,
        "media_type": mediaType,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "seen_by": List<dynamic>.from(seenBy!.map((x) => x.toMap())),
      };
}

class SeenBy {
  SeenBy({
    this.firstName,
    this.lastName,
    this.userImage,
  });

  String? firstName;
  String? lastName;
  String? userImage;

  factory SeenBy.fromJson(String str) => SeenBy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeenBy.fromMap(Map<String, dynamic> json) => SeenBy(
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
      };
}

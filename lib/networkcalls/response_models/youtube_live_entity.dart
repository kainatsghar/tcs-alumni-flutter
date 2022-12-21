// To parse this JSON data, do
//
//     final youtubeLiveEntity = youtubeLiveEntityFromMap(jsonString);

import 'dart:convert';

class YoutubeLiveEntity {
  YoutubeLiveEntity({
    this.success,
    this.message,
    this.youtubeLive,
  });

  int? success;
  String? message;
  List<YoutubeLive>? youtubeLive;

  factory YoutubeLiveEntity.fromJson(String str) =>
      YoutubeLiveEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YoutubeLiveEntity.fromMap(Map<String, dynamic> json) =>
      YoutubeLiveEntity(
        success: json["success"],
        message: json["message"],
        youtubeLive: json["youtube_live"] == null
            ? null
            : List<YoutubeLive>.from(
                json["youtube_live"].map((x) => YoutubeLive.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "youtube_live": youtubeLive == null
            ? null
            : List<dynamic>.from(youtubeLive!.map((x) => x.toMap())),
      };
}

class YoutubeLive {
  YoutubeLive({
    this.title,
    this.youtubeUrl,
  });

  String? title;
  String? youtubeUrl;

  factory YoutubeLive.fromJson(String str) =>
      YoutubeLive.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YoutubeLive.fromMap(Map<String, dynamic> json) => YoutubeLive(
        title: json["title"],
        youtubeUrl: json["youtube_url"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "youtube_url": youtubeUrl,
      };
}

class YoutubeModel {
  String? title;
  String? youtubeUrl;
  YoutubeModel({this.title, this.youtubeUrl});
}

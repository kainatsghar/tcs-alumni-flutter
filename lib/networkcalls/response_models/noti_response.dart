// To parse this JSON data, do
//
//     final notiResponse = notiResponseFromMap(jsonString);

import 'dart:convert';

import 'package:iobm/local_db/local_db.dart';

class NotiResponse {
  NotiResponse({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  Result? result;

  factory NotiResponse.fromJson(String str) =>
      NotiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotiResponse.fromMap(Map<String, dynamic> json) => NotiResponse(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "result": result == null ? null : result!.toMap(),
      };
}

class Result {
  Result({
    this.userNotifications,
  });

  List<DBNotification>? userNotifications;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userNotifications: json["user_notifications"] == null
            ? null
            : List<DBNotification>.from(json["user_notifications"]
                .map((x) => DBNotification.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "user_notifications": userNotifications == null
            ? null
            : List<dynamic>.from(userNotifications!.map((x) => x.toJson())),
      };
}

class UserNotification {
  UserNotification({
    this.notificationId,
    this.eventId,
    this.scheduleDate,
    this.userId,
    this.title,
    this.description,
    this.readStatus,
    this.notificationType,
    this.otherUserId,
  });

  String? notificationId;
  String? eventId;
  String? scheduleDate;
  String? userId;
  String? title;
  String? description;
  String? readStatus;
  String? notificationType;
  String? otherUserId;

  factory UserNotification.fromJson(String str) =>
      UserNotification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserNotification.fromMap(Map<String, dynamic> json) =>
      UserNotification(
        notificationId:
            json["notification_id"] == null ? null : json["notification_id"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        scheduleDate:
            json["schedule_date"] == null ? null : json["schedule_date"],
        userId: json["user_id"] == null ? null : json["user_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        readStatus: json["read_status"] == null ? null : json["read_status"],
        notificationType: json["notification_type"] == null
            ? null
            : json["notification_type"],
        otherUserId:
            json["other_user_id"] == null ? null : json["other_user_id"],
      );

  Map<String, dynamic> toMap() => {
        "notification_id": notificationId == null ? null : notificationId,
        "event_id": eventId == null ? null : eventId,
        "schedule_date": scheduleDate == null ? null : scheduleDate,
        "user_id": userId == null ? null : userId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "read_status": readStatus == null ? null : readStatus,
        "notification_type": notificationType == null ? null : notificationType,
        "other_user_id": otherUserId == null ? null : otherUserId,
      };
}

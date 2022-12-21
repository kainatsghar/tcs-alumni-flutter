import 'package:iobm/networkcalls/response_models/notification_entity.dart';
import 'package:iobm/local_db/local_db.dart';

notificationEntityFromJson(NotificationEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = NotificationResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> notificationEntityToJson(NotificationEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

notificationResultFromJson(NotificationResult data, Map<String, dynamic> json) {
  if (json['user_notifications'] != null) {
    data.userNotifications = (json['user_notifications'] as List)
        .map((v) => DBNotification.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> notificationResultToJson(NotificationResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user_notifications'] =
      entity.userNotifications.map((v) => v.toJson()).toList();
  return data;
}

notificationResultUserNotificationsFromJson(
    NotificationResultUserNotifications data, Map<String, dynamic> json) {
  if (json['notification_id'] != null) {
    data.notificationId = json['notification_id'].toString();
  }
  if (json['event_id'] != null) {
    data.eventId = json['event_id'].toString();
  }
  if (json['schedule_date'] != null) {
    data.scheduleDate = json['schedule_date'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'].toString();
  }
  if (json['read_status'] != null) {
    data.readStatus = json['read_status'].toString();
  }
  if (json['notification_type'] != null) {
    data.notificationType = json['notification_type'].toString();
  }
  if (json['other_user_id'] != null) {
    data.otherUserId = json['other_user_id'].toString();
  }
  return data;
}

Map<String, dynamic> notificationResultUserNotificationsToJson(
    NotificationResultUserNotifications entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['notification_id'] = entity.notificationId;
  data['event_id'] = entity.eventId;
  data['schedule_date'] = entity.scheduleDate;
  data['user_id'] = entity.userId;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['read_status'] = entity.readStatus;
  data['notification_type'] = entity.notificationType;
  data['other_user_id'] = entity.otherUserId;
  return data;
}

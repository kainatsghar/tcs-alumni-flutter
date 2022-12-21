import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class NotificationEntity with JsonConvert<NotificationEntity> {
  late int success;
  late String message;
  late NotificationResult result;
}

class NotificationResult with JsonConvert<NotificationResult> {
  @JSONField(name: "user_notifications")
  late List<DBNotification> userNotifications;
}

class NotificationResultUserNotifications
    with JsonConvert<NotificationResultUserNotifications> {
  @JSONField(name: "notification_id")
  late String notificationId;
  @JSONField(name: "event_id")
  late String eventId;
  @JSONField(name: "schedule_date")
  late String scheduleDate;
  @JSONField(name: "user_id")
  late String userId;
  late String title;
  late String description;
  @JSONField(name: "read_status")
  late String readStatus;
  @JSONField(name: "notification_type")
  late String notificationType;
  @JSONField(name: "other_user_id")
  late String otherUserId;
}

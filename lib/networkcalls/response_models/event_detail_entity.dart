import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class EventDetailEntity extends JsonConvert<EventDetailEntity> {
  int? success;
  String? message;
  List<EventDetailResult>? result;
}

class EventDetailResult extends JsonConvert<EventDetailResult> {
  String? id;
  String? title;
  String? description;
  String? image;
  @JSONField(name: "start_date")
  String? startDate;
  @JSONField(name: "end_date")
  String? endDate;
  String? venue;
  String? city;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "created_by")
  String? createdBy;
  @JSONField(name: "is_public")
  String? isPublic;
  @JSONField(name: "start_time")
  String? startTime;
  @JSONField(name: "end_time")
  String? endTime;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "user_image")
  String? userImage;
  @JSONField(name: "total_like")
  String? totalLike;
  @JSONField(name: "is_like")
  String? isLike;
  @JSONField(name: "total_comments")
  String? totalComments;
  @JSONField(name: "total_going")
  String? totalGoing;
  @JSONField(name: "is_going")
  String? isGoing;
  @JSONField(name: "total_interested")
  String? totalInterested;
  @JSONField(name: "is_interested")
  String? isInterested;
}

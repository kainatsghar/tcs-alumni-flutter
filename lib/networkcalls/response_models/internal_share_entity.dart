import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class InternalShareEntity extends JsonConvert<InternalShareEntity> {
  int? success;
  String? message;
  InternalShareResult? result;
}

class InternalShareResult extends JsonConvert<InternalShareResult> {
  @JSONField(name: "TIMELINE_POST")
  InternalShareResultTimelinePost? timelinePost;
}

class InternalShareResultTimelinePost
    extends JsonConvert<InternalShareResultTimelinePost> {
  String? id;
  @JSONField(name: "post_images")
  List<InternalShareResultTimelinePostPostImages>? postImages;
  @JSONField(name: "is_pinned")
  String? isPinned;
  @JSONField(name: "tags_details")
  List<dynamic>? tagsDetails;
  String? text;
  String? image;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "created_by")
  String? createdBy;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "user_image")
  String? userImage;
}

class InternalShareResultTimelinePostPostImages
    extends JsonConvert<InternalShareResultTimelinePostPostImages> {
  String? id;
  @JSONField(name: "post_id")
  String? postId;
  @JSONField(name: "post_media")
  String? postMedia;
  @JSONField(name: "media_type")
  String? mediaType;
  String? views;
  @JSONField(name: "created_at")
  String? createdAt;
}

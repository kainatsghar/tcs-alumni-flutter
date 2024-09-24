import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class TimeLinePostEntity extends JsonConvert<TimeLinePostEntity> {
  int? success;
  String? message;
  @JSONField(name: "current_page")
  int? currentPage;
  @JSONField(name: "is_next_post")
  String? isNextPost;
  @JSONField(name: "total_post")
  String? totalPost;
  @JSONField(name: "max_page_number")
  int? maxPageNumber;
  List<TimeLinePostTimeline>? timeline;
}

class TimeLinePostTimeline extends JsonConvert<TimeLinePostTimeline> {
  String? id;
  @JSONField(name: "is_pinned")
  String? isPinned;
  @JSONField(name: "tags_details")
  List<TimeLinePostTimelineTagsDetails>? tagsDetails;
  @JSONField(name: "updated_at_date")
  String? updatedAtDate;
  @JSONField(name: "updated_date")
  String? updatedDate;
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
  String? gender;
  @JSONField(name: "total_like")
  String? totalLike;
  @JSONField(name: "total_comments")
  String? totalComments;
  @JSONField(name: "is_like")
  String? isLike;
  @JSONField(name: "post_privacy_type")
  String? postPrivacyType;
  @JSONField(name: "is_publish")
  String? isPublish;
  @JSONField(name: "post_images")
  List<TimeLinePostTimelinePostImages>? postImages;
  @JSONField(name: "user_image")
  String? userImage;
  @JSONField(name: "shared_with")
  List<dynamic>? sharedWith;
  @JSONField(name: "group_shared_with_array")
  List<dynamic>? groupSharedWithArray;
  @JSONField(name: "user_shared_with_array")
  List<dynamic>? userSharedWithArray;
}

class TimeLinePostTimelineTagsDetails
    extends JsonConvert<TimeLinePostTimelineTagsDetails> {
  String? id;
  @JSONField(name: "post_id")
  String? postId;
  @JSONField(name: "user_id")
  String? userId;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "user_image")
  String? userImage;
  @JSONField(name: "tag_by")
  String? tagBy;
  @JSONField(name: "tag_status")
  String? tagStatus;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  @JSONField(name: "updated_by")
  String? updatedBy;
}

class TimeLinePostTimelinePostImages
    extends JsonConvert<TimeLinePostTimelinePostImages> {
  String? id;
  @JSONField(name: "post_id")
  String? postId;
  @JSONField(name: "post_media")
  String? postMedia;
  @JSONField(name: "post_media_name")
  String? postMediaName;
  @JSONField(name: "media_type")
  String? mediaType;
  String? views;
  @JSONField(name: "created_at")
  String? createdAt;
}

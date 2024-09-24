import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class TimeLinePostEntityEntity extends JsonConvert<TimeLinePostEntityEntity> {
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
  List<TimeLinePostEntityTimeline>? timeline;
}

class TimeLinePostEntityTimeline extends JsonConvert<TimeLinePostEntityTimeline> {
  String? id;
  @JSONField(name: "is_pinned")
  String? isPinned;
  @JSONField(name: "tags_details")
  List<TimeLinePostEntityTimelineTagsDetails>? tagsDetails;
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
  @JSONField(name: "total_like")
  String? totalLike;
  @JSONField(name: "total_comments")
  String? totalComments;
  @JSONField(name: "is_like")
  String? isLike;
  @JSONField(name: "event_id")
  String? eventId;
  @JSONField(name: "post_type")
  String? postType;
  @JSONField(name: "post_privacy_type")
  String? postPrivacyType;
  @JSONField(name: "is_publish")
  String? isPublish;
  @JSONField(name: "check_in_location")
  String? checkinLocation;
  @JSONField(name: "feelingName")
  String? feelingName;
  @JSONField(name: "feelingIcon")
  String? feelingIcon;
  @JSONField(name: "data_reaction")
  String? reaction;
  @JSONField(name: "post_images")
  List<TimeLinePostEntityTimelinePostImages>? postImages;
  @JSONField(name: "user_image")
  String? userImage;
  @JSONField(name: "shared_with")
  List<dynamic>? sharedWith;
  @JSONField(name: "group_shared_with_array")
  List<dynamic>? groupSharedWithArray;
  @JSONField(name: "user_shared_with_array")
  List<dynamic>? userSharedWithArray;
}

class TimeLinePostEntityTimelineTagsDetails
    extends JsonConvert<TimeLinePostEntityTimelineTagsDetails> {
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

class TimeLinePostEntityTimelinePostImages
    extends JsonConvert<TimeLinePostEntityTimelinePostImages> {
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

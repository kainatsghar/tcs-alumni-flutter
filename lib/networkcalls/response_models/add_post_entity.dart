import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class AddPostEntity with JsonConvert<AddPostEntity> {
  late int success;
  late String message;
  @JSONField(name: "timeline_post")
  late List<AddPostTimelinePost> timelinePost;
}

class AddPostTimelinePost with JsonConvert<AddPostTimelinePost> {
  late String id;
  @JSONField(name: "is_pinned")
  late String isPinned;
  @JSONField(name: "tags_details")
  late List<dynamic> tagsDetails;
  @JSONField(name: "updated_at_date")
  late String updatedAtDate;
  @JSONField(name: "updated_date")
  late String updatedDate;
  late String text;
  late String image;
  @JSONField(name: "created_at")
  late String createdAt;
  @JSONField(name: "created_by")
  late String createdBy;
  @JSONField(name: "first_name")
  late String firstName;
  @JSONField(name: "last_name")
  late String lastName;
  late String gender;
  @JSONField(name: "total_like")
  late String totalLike;
  @JSONField(name: "total_comments")
  late String totalComments;
  @JSONField(name: "is_like")
  late String isLike;
  @JSONField(name: "post_privacy_type")
  late String postPrivacyType;
  @JSONField(name: "is_publish")
  late String isPublish;
  @JSONField(name: "post_images")
  late List<AddPostTimelinePostPostImages> postImages;
  @JSONField(name: "user_image")
  late String userImage;
  @JSONField(name: "shared_with")
  late List<dynamic> sharedWith;
  @JSONField(name: "group_shared_with_array")
  late List<dynamic> groupSharedWithArray;
  @JSONField(name: "user_shared_with_array")
  late List<dynamic> userSharedWithArray;
}

class AddPostTimelinePostPostImages
    with JsonConvert<AddPostTimelinePostPostImages> {
  late String id;
  @JSONField(name: "post_id")
  late String postId;
  @JSONField(name: "post_media")
  late String postMedia;
  @JSONField(name: "post_media_name")
  late String postMediaName;
  @JSONField(name: "media_type")
  late String mediaType;
  late String views;
  @JSONField(name: "created_at")
  late String createdAt;
}

import 'package:iobm/networkcalls/response_models/add_post_entity.dart';

addPostEntityFromJson(AddPostEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['timeline_post'] != null) {
    data.timelinePost = (json['timeline_post'] as List)
        .map((v) => AddPostTimelinePost().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> addPostEntityToJson(AddPostEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['timeline_post'] = entity.timelinePost.map((v) => v.toJson()).toList();
  return data;
}

addPostTimelinePostFromJson(
    AddPostTimelinePost data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['is_pinned'] != null) {
    data.isPinned = json['is_pinned'].toString();
  }
  if (json['tags_details'] != null) {
    data.tagsDetails =
        (json['tags_details'] as List).map((v) => v).toList().cast<dynamic>();
  }
  if (json['updated_at_date'] != null) {
    data.updatedAtDate = json['updated_at_date'].toString();
  }
  if (json['updated_date'] != null) {
    data.updatedDate = json['updated_date'].toString();
  }
  if (json['text'] != null) {
    data.text = json['text'].toString();
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['created_by'] != null) {
    data.createdBy = json['created_by'].toString();
  }
  if (json['first_name'] != null) {
    data.firstName = json['first_name'].toString();
  }
  if (json['last_name'] != null) {
    data.lastName = json['last_name'].toString();
  }
  if (json['gender'] != null) {
    data.gender = json['gender'].toString();
  }
  if (json['total_like'] != null) {
    data.totalLike = json['total_like'].toString();
  }
  if (json['total_comments'] != null) {
    data.totalComments = json['total_comments'].toString();
  }
  if (json['is_like'] != null) {
    data.isLike = json['is_like'].toString();
  }
  if (json['post_privacy_type'] != null) {
    data.postPrivacyType = json['post_privacy_type'].toString();
  }
  if (json['is_publish'] != null) {
    data.isPublish = json['is_publish'].toString();
  }
  if (json['post_images'] != null) {
    data.postImages = (json['post_images'] as List)
        .map((v) => AddPostTimelinePostPostImages().fromJson(v))
        .toList();
  }
  if (json['user_image'] != null) {
    data.userImage = json['user_image'].toString();
  }
  if (json['shared_with'] != null) {
    data.sharedWith =
        (json['shared_with'] as List).map((v) => v).toList().cast<dynamic>();
  }
  if (json['group_shared_with_array'] != null) {
    data.groupSharedWithArray = (json['group_shared_with_array'] as List)
        .map((v) => v)
        .toList()
        .cast<dynamic>();
  }
  if (json['user_shared_with_array'] != null) {
    data.userSharedWithArray = (json['user_shared_with_array'] as List)
        .map((v) => v)
        .toList()
        .cast<dynamic>();
  }
  return data;
}

Map<String, dynamic> addPostTimelinePostToJson(AddPostTimelinePost entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['is_pinned'] = entity.isPinned;
  data['tags_details'] = entity.tagsDetails;
  data['updated_at_date'] = entity.updatedAtDate;
  data['updated_date'] = entity.updatedDate;
  data['text'] = entity.text;
  data['image'] = entity.image;
  data['created_at'] = entity.createdAt;
  data['created_by'] = entity.createdBy;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['gender'] = entity.gender;
  data['total_like'] = entity.totalLike;
  data['total_comments'] = entity.totalComments;
  data['is_like'] = entity.isLike;
  data['post_privacy_type'] = entity.postPrivacyType;
  data['is_publish'] = entity.isPublish;
  data['post_images'] = entity.postImages.map((v) => v.toJson()).toList();
  data['user_image'] = entity.userImage;
  data['shared_with'] = entity.sharedWith;
  data['group_shared_with_array'] = entity.groupSharedWithArray;
  data['user_shared_with_array'] = entity.userSharedWithArray;
  return data;
}

addPostTimelinePostPostImagesFromJson(
    AddPostTimelinePostPostImages data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['post_id'] != null) {
    data.postId = json['post_id'].toString();
  }
  if (json['post_media'] != null) {
    data.postMedia = json['post_media'].toString();
  }
  if (json['post_media_name'] != null) {
    data.postMediaName = json['post_media_name'].toString();
  }
  if (json['media_type'] != null) {
    data.mediaType = json['media_type'].toString();
  }
  if (json['views'] != null) {
    data.views = json['views'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  return data;
}

Map<String, dynamic> addPostTimelinePostPostImagesToJson(
    AddPostTimelinePostPostImages entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['post_id'] = entity.postId;
  data['post_media'] = entity.postMedia;
  data['post_media_name'] = entity.postMediaName;
  data['media_type'] = entity.mediaType;
  data['views'] = entity.views;
  data['created_at'] = entity.createdAt;
  return data;
}

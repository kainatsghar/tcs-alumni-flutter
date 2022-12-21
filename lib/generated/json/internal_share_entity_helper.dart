import 'package:iobm/networkcalls/response_models/internal_share_entity.dart';

internalShareEntityFromJson(
    InternalShareEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = InternalShareResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> internalShareEntityToJson(InternalShareEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

internalShareResultFromJson(
    InternalShareResult data, Map<String, dynamic> json) {
  if (json['TIMELINE_POST'] != null) {
    data.timelinePost =
        InternalShareResultTimelinePost().fromJson(json['TIMELINE_POST']);
  }
  return data;
}

Map<String, dynamic> internalShareResultToJson(InternalShareResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['TIMELINE_POST'] = entity.timelinePost?.toJson();
  return data;
}

internalShareResultTimelinePostFromJson(
    InternalShareResultTimelinePost data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['post_images'] != null) {
    data.postImages = (json['post_images'] as List)
        .map((v) => InternalShareResultTimelinePostPostImages().fromJson(v))
        .toList();
  }
  if (json['is_pinned'] != null) {
    data.isPinned = json['is_pinned'].toString();
  }
  if (json['tags_details'] != null) {
    data.tagsDetails =
        (json['tags_details'] as List).map((v) => v).toList().cast<dynamic>();
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
  if (json['user_image'] != null) {
    data.userImage = json['user_image'].toString();
  }
  return data;
}

Map<String, dynamic> internalShareResultTimelinePostToJson(
    InternalShareResultTimelinePost entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['post_images'] = entity.postImages?.map((v) => v.toJson()).toList();
  data['is_pinned'] = entity.isPinned;
  data['tags_details'] = entity.tagsDetails;
  data['text'] = entity.text;
  data['image'] = entity.image;
  data['created_at'] = entity.createdAt;
  data['created_by'] = entity.createdBy;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  return data;
}

internalShareResultTimelinePostPostImagesFromJson(
    InternalShareResultTimelinePostPostImages data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['post_id'] != null) {
    data.postId = json['post_id'].toString();
  }
  if (json['post_media'] != null) {
    data.postMedia = json['post_media'].toString();
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

Map<String, dynamic> internalShareResultTimelinePostPostImagesToJson(
    InternalShareResultTimelinePostPostImages entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['post_id'] = entity.postId;
  data['post_media'] = entity.postMedia;
  data['media_type'] = entity.mediaType;
  data['views'] = entity.views;
  data['created_at'] = entity.createdAt;
  return data;
}

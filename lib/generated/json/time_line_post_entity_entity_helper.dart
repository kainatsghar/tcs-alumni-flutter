import 'package:iobm/networkcalls/response_models/time_line_post_entity_entity.dart';

timeLinePostEntityEntityFromJson(
    TimeLinePostEntityEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['current_page'] != null) {
    data.currentPage = json['current_page'] is String
        ? int.tryParse(json['current_page'])
        : json['current_page'].toInt();
  }
  if (json['is_next_post'] != null) {
    data.isNextPost = json['is_next_post'].toString();
  }
  if (json['total_post'] != null) {
    data.totalPost = json['total_post'].toString();
  }
  if (json['max_page_number'] != null) {
    data.maxPageNumber = json['max_page_number'] is String
        ? int.tryParse(json['max_page_number'])
        : json['max_page_number'].toInt();
  }
  if (json['timeline'] != null) {
    data.timeline = (json['timeline'] as List)
        .map((v) => TimeLinePostEntityTimeline().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> timeLinePostEntityEntityToJson(
    TimeLinePostEntityEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['current_page'] = entity.currentPage;
  data['is_next_post'] = entity.isNextPost;
  data['total_post'] = entity.totalPost;
  data['max_page_number'] = entity.maxPageNumber;
  data['timeline'] = entity.timeline?.map((v) => v.toJson()).toList();
  return data;
}

timeLinePostEntityTimelineFromJson(
    TimeLinePostEntityTimeline data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['is_pinned'] != null) {
    data.isPinned = json['is_pinned'].toString();
  }
  if (json['tags_details'] != null) {
    data.tagsDetails = (json['tags_details'] as List)
        .map((v) => TimeLinePostEntityTimelineTagsDetails().fromJson(v))
        .toList();
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
  if (json['total_like'] != null) {
    data.totalLike = json['total_like'].toString();
  }
  if (json['total_comments'] != null) {
    data.totalComments = json['total_comments'].toString();
  }
  if (json['is_like'] != null) {
    data.isLike = json['is_like'].toString();
  }
  if (json['event_id'] != null) {
    data.eventId = json['event_id'].toString();
  }
  if (json['post_type'] != null) {
    data.postType = json['post_type'].toString();
  }
  if (json['post_privacy_type'] != null) {
    data.postPrivacyType = json['post_privacy_type'].toString();
  }
  if (json['is_publish'] != null) {
    data.isPublish = json['is_publish'].toString();
  }
  if (json['check_in_location'] != null) {
    data.checkinLocation = json['check_in_location'].toString();
  }
  if (json['feelingName'] != null) {
    data.feelingName = json['feelingName'].toString();
  }
  if (json['feelingIcon'] != null) {
    data.feelingIcon = json['feelingIcon'].toString();
  }
  if (json['data_reaction'] != null) {
    data.reaction = json['data_reaction'].toString();
  }
  if (json['post_images'] != null) {
    data.postImages = (json['post_images'] as List)
        .map((v) => TimeLinePostEntityTimelinePostImages().fromJson(v))
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

Map<String, dynamic> timeLinePostEntityTimelineToJson(
    TimeLinePostEntityTimeline entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['is_pinned'] = entity.isPinned;
  data['tags_details'] = entity.tagsDetails?.map((v) => v.toJson()).toList();
  data['updated_at_date'] = entity.updatedAtDate;
  data['updated_date'] = entity.updatedDate;
  data['text'] = entity.text;
  data['image'] = entity.image;
  data['created_at'] = entity.createdAt;
  data['created_by'] = entity.createdBy;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['total_like'] = entity.totalLike;
  data['total_comments'] = entity.totalComments;
  data['is_like'] = entity.isLike;
  data['event_id'] = entity.eventId;
  data['post_type'] = entity.postType;
  data['post_privacy_type'] = entity.postPrivacyType;
  data['is_publish'] = entity.isPublish;
  data['check_in_location'] = entity.checkinLocation;
  data['feelingName'] = entity.feelingName;
  data['feelingIcon'] = entity.feelingIcon;
  data['data_reaction'] = entity.reaction;
  data['post_images'] = entity.postImages?.map((v) => v.toJson()).toList();
  data['user_image'] = entity.userImage;
  data['shared_with'] = entity.sharedWith;
  data['group_shared_with_array'] = entity.groupSharedWithArray;
  data['user_shared_with_array'] = entity.userSharedWithArray;
  return data;
}

timeLinePostEntityTimelineTagsDetailsFromJson(
    TimeLinePostEntityTimelineTagsDetails data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['post_id'] != null) {
    data.postId = json['post_id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
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
  if (json['tag_by'] != null) {
    data.tagBy = json['tag_by'].toString();
  }
  if (json['tag_status'] != null) {
    data.tagStatus = json['tag_status'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['updated_at'] != null) {
    data.updatedAt = json['updated_at'].toString();
  }
  if (json['updated_by'] != null) {
    data.updatedBy = json['updated_by'].toString();
  }
  return data;
}

Map<String, dynamic> timeLinePostEntityTimelineTagsDetailsToJson(
    TimeLinePostEntityTimelineTagsDetails entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['post_id'] = entity.postId;
  data['user_id'] = entity.userId;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  data['tag_by'] = entity.tagBy;
  data['tag_status'] = entity.tagStatus;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['updated_by'] = entity.updatedBy;
  return data;
}

timeLinePostEntityTimelinePostImagesFromJson(
    TimeLinePostEntityTimelinePostImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> timeLinePostEntityTimelinePostImagesToJson(
    TimeLinePostEntityTimelinePostImages entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['post_id'] = entity.postId;
  data['post_media'] = entity.postMedia;
  data['media_type'] = entity.mediaType;
  data['views'] = entity.views;
  data['created_at'] = entity.createdAt;
  return data;
}

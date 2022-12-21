import 'package:iobm/networkcalls/response_models/comments_entity.dart';
import 'package:iobm/local_db/local_db.dart';

commentsEntityFromJson(CommentsEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = CommentsResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> commentsEntityToJson(CommentsEntity entity) {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result!.toJson();
  return data;
}

commentsResultFromJson(CommentsResult data, Map<String, dynamic> json) {
  if (json['all_comments'] != null) {
    data.allComments = (json['all_comments'] as List)
        .map((v) => DBComment.fromJson(v))
        .toList();
  }
  if (json['common_connections'] != null) {
    data.commonConnections = (json['common_connections'] as List)
        .map((v) => v)
        .toList()
        .cast<dynamic>();
  }
  return data;
}

Map<String, dynamic> commentsResultToJson(CommentsResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['all_comments'] = entity.allComments!.map((v) => v.toJson()).toList();
  data['common_connections'] = entity.commonConnections;
  return data;
}

commentsResultAllCommentsFromJson(
    CommentsResultAllComments data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['text'] != null) {
    data.text = json['text'].toString();
  }
  if (json['created_date'] != null) {
    data.createdDate = json['created_date'].toString();
  }
  if (json['commented_by'] != null) {
    data.commentedBy = json['commented_by'].toString();
  }
  if (json['post_id'] != null) {
    data.postId = json['post_id'].toString();
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
  if (json['is_like'] != null) {
    data.isLike = json['is_like'].toString();
  }
  if (json['like_count'] != null) {
    data.likeCount = json['like_count'].toString();
  }
  if (json['data_reaction'] != null) {
    data.reaction = json['data_reaction'].toString();
  }
  if (json['comment_image'] != null) {
    data.commentImage = json['comment_image'].toString();
  }
  if (json['comment_image_type'] != null) {
    data.commentImageType = json['comment_image_type'].toString();
  }
  if (json['replies'] != null) {
    data.replies = (json['replies'] as List)
        .map((v) => CommentsReplies().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> commentsResultAllCommentsToJson(
    CommentsResultAllComments entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['text'] = entity.text;
  data['created_date'] = entity.createdDate;
  data['commented_by'] = entity.commentedBy;
  data['post_id'] = entity.postId;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  data['type'] = entity.type;
  data['is_like'] = entity.isLike;
  data['like_count'] = entity.likeCount;
  data['data_reaction'] = entity.reaction;
  data['comment_image'] = entity.commentImage;
  data['comment_image_type'] = entity.commentImageType;
  data['replies'] = entity.replies?.map((v) => v.toJson()).toList();
  return data;
}

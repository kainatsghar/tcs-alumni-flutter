import 'package:iobm/networkcalls/response_models/insert_comment_entity.dart';

insertCommentEntityFromJson(
    InsertCommentEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = InsertCommentResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> insertCommentEntityToJson(InsertCommentEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

insertCommentResultFromJson(
    InsertCommentResult data, Map<String, dynamic> json) {
  if (json['likes'] != null) {
    data.likes = json['likes'] is String
        ? int.tryParse(json['likes'])
        : json['likes'].toInt();
  }
  if (json['comments'] != null) {
    data.comments = json['comments'] is String
        ? int.tryParse(json['comments'])
        : json['comments'].toInt();
  }
  if (json['comment_model'] != null) {
    data.commentModel =
        InsertCommentResultCommentModel().fromJson(json['comment_model']);
  }
  return data;
}

Map<String, dynamic> insertCommentResultToJson(InsertCommentResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['likes'] = entity.likes;
  data['comments'] = entity.comments;
  data['comment_model'] = entity.commentModel?.toJson();
  return data;
}

insertCommentResultCommentModelFromJson(
    InsertCommentResultCommentModel data, Map<String, dynamic> json) {
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
  if (json['comment_image'] != null) {
    data.commentImage = json['comment_image'].toString();
  }
  if (json['comment_image_type'] != null) {
    data.commentImageType = json['comment_image_type'].toString();
  }
  return data;
}

Map<String, dynamic> insertCommentResultCommentModelToJson(
    InsertCommentResultCommentModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['text'] = entity.text;
  data['created_date'] = entity.createdDate;
  data['commented_by'] = entity.commentedBy;
  data['post_id'] = entity.postId;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  data['comment_image'] = entity.commentImage;
  data['comment_image_type'] = entity.commentImageType;
  return data;
}

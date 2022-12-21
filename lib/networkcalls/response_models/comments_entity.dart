import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class CommentsEntity with JsonConvert<CommentsEntity> {
  int? success;
  String? message;
  CommentsResult? result;
}

class CommentsResult with JsonConvert<CommentsResult> {
  @JSONField(name: "all_comments")
  List<DBComment>? allComments;
  @JSONField(name: "common_connections")
  List<dynamic>? commonConnections;
}

class CommentsResultAllComments with JsonConvert<CommentsResultAllComments> {
  String? id;
  String? text;
  @JSONField(name: "created_date")
  String? createdDate;
  @JSONField(name: "commented_by")
  String? commentedBy;
  @JSONField(name: "post_id")
  String? postId;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "user_image")
  String? userImage;

  @JSONField(name: "is_like")
  String? isLike;
  @JSONField(name: "like_count")
  String? likeCount;
  @JSONField(name: "data_reaction")
  String? reaction;
  @JSONField(name: "comment_image")
  String? commentImage;
  @JSONField(name: "comment_image_type")
  String? commentImageType;
  String? type;
  List<CommentsReplies>? replies;
}

class CommentsReplies with JsonConvert<CommentsReplies> {
  String? id;
  String? text;
  @JSONField(name: "created_date")
  String? createdDate;
  @JSONField(name: "commented_by")
  String? commentedBy;
  @JSONField(name: "comment_id")
  String? commentId;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "user_image")
  String? userImage;
  @JSONField(name: "is_like")
  String? isLike;
  @JSONField(name: "like_count")
  String? likeCount;
  @JSONField(name: "data_reaction")
  String? reaction;
  @JSONField(name: "comment_image")
  String? commentImage;
  @JSONField(name: "comment_image_type")
  String? commentImageType;
  String? type;
}

import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class InsertCommentEntity with JsonConvert<InsertCommentEntity> {
  int? success;
  String? message;
  InsertCommentResult? result;
}

class InsertCommentResult with JsonConvert<InsertCommentResult> {
  int? likes;
  int? comments;
  @JSONField(name: "comment_model")
  InsertCommentResultCommentModel? commentModel;
}

class InsertCommentResultCommentModel
    with JsonConvert<InsertCommentResultCommentModel> {
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
  @JSONField(name: "comment_image")
  String? commentImage;
  @JSONField(name: "comment_image_type")
  String? commentImageType;
}

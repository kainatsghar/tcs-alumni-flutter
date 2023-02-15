// To parse this JSON data, do
//
//     final replyEntity = replyEntityFromMap(jsonString);

import 'dart:convert';

class ReplyEntity {
  ReplyEntity({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  Result? result;

  factory ReplyEntity.fromJson(String str) =>
      ReplyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  // factory ReplyEntity.fromMap(Map<String, dynamic> json) => ReplyEntity(
  //       success: json["success"],
  //       message: json["message"],
  //       result: Result.fromMap(json["result"]),
  //     );

  factory ReplyEntity.fromMap(Map<String, dynamic> json) => ReplyEntity(
    success: json["success"],
    message: json["message"],
    result: json["result"] != null ? Result.fromMap(json["result"]) : null,
  );


  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "result": result!.toMap(),
      };
}

class Result {
  Result({
    this.comments,
    this.commentModel,
  });

  int? comments;
  CommentModel? commentModel;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        comments: json["comments"],
        commentModel: CommentModel.fromMap(json["comment_model"]),
      );

  Map<String, dynamic> toMap() => {
        "comments": comments,
        "comment_model": commentModel!.toMap(),
      };
}

class CommentModel {
  CommentModel({
    this.id,
    this.text,
    this.createdDate,
    this.commentedBy,
    this.commentId,
    this.firstName,
    this.lastName,
    this.userImage,
    this.commentImage,
    this.commentImageType,
  });

  String? id;
  String? text;
  String? createdDate;
  String? commentedBy;
  String? commentId;
  String? firstName;
  String? lastName;
  String? userImage;
  String? commentImage;
  String? commentImageType;

  factory CommentModel.fromJson(String str) =>
      CommentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentModel.fromMap(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        text: json["text"],
        createdDate: json["created_date"],
        commentedBy: json["commented_by"],
        commentId: json["comment_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
        commentImage: json["comment_image"],
        commentImageType: json["comment_image_type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text": text,
        "created_date": createdDate,
        "commented_by": commentedBy,
        "comment_id": commentId,
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
        "comment_image": commentImage,
        "comment_image_type": commentImageType,
      };
}

// To parse this JSON data, do
//
//     final commentEntity = commentEntityFromMap(jsonString);

import 'dart:convert';

class CommentEntity {
  CommentEntity({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  Result? result;

  factory CommentEntity.fromJson(String str) =>
      CommentEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentEntity.fromMap(Map<String, dynamic> json) => CommentEntity(
        success: json["success"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "result": result!.toMap(),
      };
}

class Result {
  Result({
    this.allComments,
    this.commonConnections,
  });

  List<AllComment>? allComments;
  List<dynamic>? commonConnections;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        allComments: List<AllComment>.from(
            json["all_comments"].map((x) => AllComment.fromMap(x))),
        commonConnections:
            List<dynamic>.from(json["common_connections"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "all_comments": List<dynamic>.from(allComments!.map((x) => x.toMap())),
        "common_connections":
            List<dynamic>.from(commonConnections!.map((x) => x)),
      };
}

class AllComment {
  AllComment({
    this.id,
    this.text,
    this.createdDate,
    this.commentedBy,
    this.postId,
    this.firstName,
    this.lastName,
    this.userImage,
    this.type,
    this.isLike,
    this.likeCount,
    this.dataReaction,
    this.commentImage,
    this.commentImageType,
    this.replies,
  });

  String? id;
  String? text;
  String? createdDate;
  String? commentedBy;
  String? postId;
  String? firstName;
  String? lastName;
  String? userImage;
  String? type;
  String? isLike;
  String? likeCount;
  String? dataReaction;
  String? commentImage;
  String? commentImageType;
  List<Reply>? replies;

  factory AllComment.fromJson(String str) =>
      AllComment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllComment.fromMap(Map<String, dynamic> json) => AllComment(
        id: json["id"],
        text: json["text"],
        createdDate: json["created_date"],
        commentedBy: json["commented_by"],
        postId: json["post_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
        type: json["type"],
        isLike: json["is_like"],
        likeCount: json["like_count"],
        dataReaction: json["data_reaction"],
        commentImage: json["comment_image"],
        commentImageType: json["comment_image_type"],
        replies: List<Reply>.from(json["replies"].map((x) => Reply.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text": text,
        "created_date": createdDate,
        "commented_by": commentedBy,
        "post_id": postId,
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
        "type": type,
        "is_like": isLike,
        "like_count": likeCount,
        "data_reaction": dataReaction,
        "comment_image": commentImage,
        "comment_image_type": commentImageType,
        "replies": List<dynamic>.from(replies!.map((x) => x.toMap())),
      };
}

class Reply {
  Reply({
    this.id,
    this.text,
    this.createdDate,
    this.commentedBy,
    this.commentId,
    this.type,
    this.commentImage,
    this.commentImageType,
    this.firstName,
    this.userImage,
    this.isLike,
    this.likeCount,
    this.dataReaction,
    this.lastName,
  });

  int? id;
  String? text;
  String? createdDate;
  int? commentedBy;
  int? commentId;
  String? type;
  String? commentImage;
  String? commentImageType;
  String? firstName;
  String? userImage;
  String? isLike;
  String? likeCount;
  String? dataReaction;
  String? lastName;

  factory Reply.fromJson(String str) => Reply.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reply.fromMap(Map<String, dynamic> json) => Reply(
        id: json["id"],
        text: json["text"],
        createdDate: json["created_date"],
        commentedBy: json["commented_by"],
        commentId: json["comment_id"],
        type: json["type"],
        commentImage: json["comment_image"],
        commentImageType: json["comment_image_type"],
        firstName: json["first_name"],
        userImage: json["user_image"],
        isLike: json["is_like"],
        likeCount: json["like_count"],
        dataReaction: json["data_reaction"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text": text,
        "created_date": createdDate,
        "commented_by": commentedBy,
        "comment_id": commentId,
        "type": type,
        "comment_image": commentImage,
        "comment_image_type": commentImageType,
        "first_name": firstName,
        "user_image": userImage,
        "is_like": isLike,
        "like_count": likeCount,
        "data_reaction": dataReaction,
        "last_name": lastName,
      };
}

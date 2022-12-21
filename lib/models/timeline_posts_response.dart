// // To parse this JSON data, do
// //
// //     final timeLinePostResponse = timeLinePostResponseFromMap(jsonString);
//
// import 'dart:convert';
//
// import 'package:iobm/local_db/local_db.dart';
//
// class TimeLinePostResponse {
//   TimeLinePostResponse({
//     this.success,
//     this.message,
//     this.currentPage,
//     this.isNextPost,
//     this.totalPost,
//     this.maxPageNumber,
//     this.timeline,
//   });
//
//   int? success;
//   String? message;
//   int? currentPage;
//   String? isNextPost;
//   String? totalPost;
//   int? maxPageNumber;
//   List<Timeline>? timeline;
//
//   factory TimeLinePostResponse.fromJson(String str) =>
//       TimeLinePostResponse.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory TimeLinePostResponse.fromMap(Map<String, dynamic> json) =>
//       TimeLinePostResponse(
//         success: json["success"] == null ? null : json["success"],
//         message: json["message"] == null ? null : json["message"],
//         currentPage: json["current_page"] == null ? null : json["current_page"],
//         isNextPost: json["is_next_post"] == null ? null : json["is_next_post"],
//         totalPost: json["total_post"] == null ? null : json["total_post"],
//         maxPageNumber:
//             json["max_page_number"] == null ? null : json["max_page_number"],
//         timeline: json["timeline"] == null
//             ? null
//             : List<Timeline>.from(
//                 json["timeline"].map((x) => Timeline.fromMap(x))),
//       );
//
//   Map<String, dynamic> toMap() => {
//         "success": success == null ? null : success,
//         "message": message == null ? null : message,
//         "current_page": currentPage == null ? null : currentPage,
//         "is_next_post": isNextPost == null ? null : isNextPost,
//         "total_post": totalPost == null ? null : totalPost,
//         "max_page_number": maxPageNumber == null ? null : maxPageNumber,
//         "timeline": timeline == null
//             ? null
//             : List<dynamic>.from(timeline!.map((x) => x.toMap())),
//       };
// }
//
// class Timeline {
//   Timeline({
//     this.id,
//     this.isPinned,
//     this.tagsDetails,
//     this.updatedAtDate,
//     this.updatedDate,
//     this.text,
//     this.image,
//     this.createdAt,
//     this.createdBy,
//     this.firstName,
//     this.lastName,
//     this.gender,
//     this.totalLike,
//     this.totalComments,
//     this.isLike,
//     this.postPrivacyType,
//     this.isPublish,
//     this.postImages,
//     this.userImage,
//     this.sharedWith,
//     this.groupSharedWithArray,
//     this.userSharedWithArray,
//   });
//
//   String? id;
//   String? isPinned;
//   List<dynamic>? tagsDetails;
//   DateTime? updatedAtDate;
//   String? updatedDate;
//   String? text;
//   String? image;
//   String? createdAt;
//   String? createdBy;
//   String? firstName;
//   String? lastName;
//   String? gender;
//   String? totalLike;
//   String? totalComments;
//   String? isLike;
//   String? postPrivacyType;
//   String? isPublish;
//   List<DBPostImage>? postImages;
//   String? userImage;
//   List<dynamic>? sharedWith;
//   List<String>? groupSharedWithArray;
//   List<dynamic>? userSharedWithArray;
//
//   factory Timeline.fromJson(String str) => Timeline.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Timeline.fromMap(Map<String, dynamic> json) => Timeline(
//         id: json["id"] == null ? null : json["id"],
//         isPinned: json["is_pinned"] == null ? null : json["is_pinned"],
//         tagsDetails: json["tags_details"] == null
//             ? null
//             : List<dynamic>.from(json["tags_details"].map((x) => x)),
//         updatedAtDate: json["updated_at_date"] == null
//             ? null
//             : DateTime.parse(json["updated_at_date"]),
//         updatedDate: json["updated_date"] == null ? null : json["updated_date"],
//         text: json["text"] == null ? null : json["text"],
//         image: json["image"] == null ? null : json["image"],
//         createdAt: json["created_at"] == null ? null : json["created_at"],
//         createdBy: json["created_by"] == null ? null : json["created_by"],
//         firstName: json["first_name"] == null ? null : json["first_name"],
//         lastName: json["last_name"] == null ? null : json["last_name"],
//         gender: json["gender"] == null ? null : json["gender"],
//         totalLike: json["total_like"] == null ? null : json["total_like"],
//         totalComments:
//             json["total_comments"] == null ? null : json["total_comments"],
//         isLike: json["is_like"] == null ? null : json["is_like"],
//         postPrivacyType: json["post_privacy_type"] == null
//             ? null
//             : json["post_privacy_type"],
//         isPublish: json["is_publish"] == null ? null : json["is_publish"],
//         postImages: json["post_images"] == null
//             ? null
//             : List<DBPostImage>.from(
//                 json["post_images"].map((x) => DBPostImage.fromJson(x))),
//         userImage: json["user_image"] == null ? null : json["user_image"],
//         sharedWith: json["shared_with"] == null
//             ? null
//             : List<dynamic>.from(json["shared_with"].map((x) => x)),
//         groupSharedWithArray: json["group_shared_with_array"] == null
//             ? null
//             : List<String>.from(json["group_shared_with_array"].map((x) => x)),
//         userSharedWithArray: json["user_shared_with_array"] == null
//             ? null
//             : List<dynamic>.from(json["user_shared_with_array"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "is_pinned": isPinned == null ? null : isPinned,
//         "tags_details": tagsDetails == null
//             ? null
//             : List<dynamic>.from(tagsDetails!.map((x) => x)),
//         "updated_at_date": updatedAtDate == null ? null : updatedAtDate,
//         "updated_date": updatedDate == null ? null : updatedDate,
//         "text": text == null ? null : text,
//         "image": image == null ? null : image,
//         "created_at": createdAt == null ? null : createdAt,
//         "created_by": createdBy == null ? null : createdBy,
//         "first_name": firstName == null ? null : firstName,
//         "last_name": lastName == null ? null : lastName,
//         "gender": gender == null ? null : gender,
//         "total_like": totalLike == null ? null : totalLike,
//         "total_comments": totalComments == null ? null : totalComments,
//         "is_like": isLike == null ? null : isLike,
//         "post_privacy_type": postPrivacyType == null ? null : postPrivacyType,
//         "is_publish": isPublish == null ? null : isPublish,
//         "post_images": postImages == null
//             ? null
//             : List<dynamic>.from(postImages!.map((x) => x.toJson())),
//         "user_image": userImage == null ? null : userImage,
//         "shared_with": sharedWith == null
//             ? null
//             : List<dynamic>.from(sharedWith!.map((x) => x)),
//         "group_shared_with_array": groupSharedWithArray == null
//             ? null
//             : List<dynamic>.from(groupSharedWithArray!.map((x) => x)),
//         "user_shared_with_array": userSharedWithArray == null
//             ? null
//             : List<dynamic>.from(userSharedWithArray!.map((x) => x)),
//       };
// }
//
// class PostImage {
//   PostImage({
//     this.id,
//     this.postId,
//     this.postMedia,
//     this.postMediaName,
//     this.mediaType,
//     this.views,
//     this.createdAt,
//   });
//
//   String? id;
//   String? postId;
//   String? postMedia;
//   String? postMediaName;
//   String? mediaType;
//   String? views;
//   String? createdAt;
//
//   factory PostImage.fromJson(String str) => PostImage.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory PostImage.fromMap(Map<String, dynamic> json) => PostImage(
//         id: json["id"] == null ? null : json["id"],
//         postId: json["post_id"] == null ? null : json["post_id"],
//         postMedia: json["post_media"] == null ? null : json["post_media"],
//         postMediaName:
//             json["post_media_name"] == null ? null : json["post_media_name"],
//         mediaType: json["media_type"] == null ? null : json["media_type"],
//         views: json["views"] == null ? null : json["views"],
//         createdAt: json["created_at"] == null ? null : json["created_at"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "post_id": postId == null ? null : postId,
//         "post_media": postMedia == null ? null : postMedia,
//         "post_media_name": postMediaName == null ? null : postMediaName,
//         "media_type": mediaType == null ? null : mediaType,
//         "views": views == null ? null : views,
//         "created_at": createdAt == null ? null : createdAt,
//       };
// }
// To parse this JSON data, do
//
//     final forgetPasswordEntity = forgetPasswordEntityFromMap(jsonString);

import 'dart:convert';

import 'package:iobm/local_db/local_db.dart';

class ForgetPasswordEntity {
  ForgetPasswordEntity({
    this.success,
    this.message,
    this.currentPage,
    this.isNextPost,
    this.totalPost,
    this.maxPageNumber,
    this.timeline,
  });

  int? success;
  String? message;
  int? currentPage;
  String? isNextPost;
  String? totalPost;
  int? maxPageNumber;
  List<Timeline>? timeline;

  factory ForgetPasswordEntity.fromJson(String str) =>
      ForgetPasswordEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForgetPasswordEntity.fromMap(Map<String, dynamic> json) =>
      ForgetPasswordEntity(
        success: json["success"],
        message: json["message"],
        currentPage: json["current_page"],
        isNextPost: json["is_next_post"],
        totalPost: json["total_post"],
        maxPageNumber: json["max_page_number"],
        timeline: List<Timeline>.from(
            json["timeline"].map((x) => Timeline.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "current_page": currentPage,
        "is_next_post": isNextPost,
        "total_post": totalPost,
        "max_page_number": maxPageNumber,
        "timeline": List<dynamic>.from(timeline!.map((x) => x.toMap())),
      };
}

class Timeline {
  Timeline(
      {this.id,
      this.isPinned,
      this.tagsDetails,
      this.updatedAtDate,
      this.updatedDate,
      this.text,
      this.image,
      this.createdAt,
      this.createdBy,
      this.firstName,
      this.lastName,
      this.gender,
      this.totalLike,
      this.totalComments,
      this.isLike,
      this.postPrivacyType,
      this.isPublish,
      this.feelingIcon,
      this.feelingName,
      this.reaction,
      this.checkinLocation,
      this.postImages,
      this.userImage,
      this.eventId,
      this.postType
      // this.sharedWith,
      // this.groupSharedWithArray,
      // this.userSharedWithArray,
      });

  String? id;
  String? isPinned;
  List<DBPostTag>? tagsDetails;
  DateTime? updatedAtDate;
  String? updatedDate;
  String? text;
  String? image;
  String? createdAt;
  String? createdBy;
  String? firstName;
  String? lastName;
  String? gender;
  String? totalLike;
  String? totalComments;
  String? isLike;
  String? postPrivacyType;
  String? isPublish;
  String? checkinLocation;
  String? feelingIcon;
  String? feelingName;
  String? reaction;
  List<DBPostImage>? postImages;
  String? userImage;
  String? eventId;
  String? postType;
  // List<dynamic>? sharedWith;
  // List<dynamic>? groupSharedWithArray;
  // List<dynamic>? userSharedWithArray;

  factory Timeline.fromJson(String str) => Timeline.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Timeline.fromMap(Map<String, dynamic> json) => Timeline(
        id: json["id"],
        isPinned: json["is_pinned"],
        tagsDetails: List<DBPostTag>.from(
            json["tags_details"].map((x) => DBPostTag.fromJson(x))),
        updatedAtDate: DateTime.parse(json["updated_at_date"]),
        updatedDate: json["updated_date"],
        text: json["text"],
        image: json["image"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        totalLike: json["total_like"],
        totalComments: json["total_comments"],
        isLike: json["is_like"],
        postPrivacyType: json["post_privacy_type"],
        isPublish: json["is_publish"],
        checkinLocation: json["check_in_location"],
        feelingName: json["feelingName"],
        feelingIcon: json["feelingIcon"],
        reaction: json["data_reaction"],
        postImages: List<DBPostImage>.from(
            json["post_images"].map((x) => DBPostImage.fromJson(x))),
        userImage: json["user_image"],
        eventId: json["event_id"],
        postType: json["post_type"],

        // sharedWith: List<dynamic>.from(json["shared_with"].map((x) => x)),
        // groupSharedWithArray:
        //     List<dynamic>.from(json["group_shared_with_array"].map((x) => x)),
        // userSharedWithArray:
        //     List<dynamic>.from(json["user_shared_with_array"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "is_pinned": isPinned,
        "tags_details": List<dynamic>.from(tagsDetails!.map((x) => x.toJson())),
        "updated_at_date": updatedAtDate,
        "updated_date": updatedDate,
        "text": text,
        "image": image,
        "created_at": createdAt,
        "created_by": createdBy,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "total_like": totalLike,
        "total_comments": totalComments,
        "is_like": isLike,
        "post_privacy_type": postPrivacyType,
        "is_publish": isPublish,
        "check_in_location": checkinLocation,
        "feelingName": feelingName,
        "feelingIcon": feelingIcon,
        "data_reaction": reaction,
        "post_images": List<dynamic>.from(postImages!.map((x) => x.toJson())),
        "user_image": userImage,
        "event_id": eventId,
        "post_type": postType,
        // "shared_with": List<dynamic>.from(sharedWith!.map((x) => x)),
        // "group_shared_with_array":
        //     List<dynamic>.from(groupSharedWithArray!.map((x) => x)),
        // "user_shared_with_array":
        //     List<dynamic>.from(userSharedWithArray!.map((x) => x)),
      };
}

class PostImage {
  PostImage({
    this.id,
    this.postId,
    this.postMedia,
    this.postMediaName,
    this.mediaType,
    this.views,
    this.createdAt,
  });

  String? id;
  String? postId;
  String? postMedia;
  String? postMediaName;
  String? mediaType;
  String? views;
  String? createdAt;

  factory PostImage.fromJson(String str) => PostImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostImage.fromMap(Map<String, dynamic> json) => PostImage(
        id: json["id"],
        postId: json["post_id"],
        postMedia: json["post_media"],
        postMediaName: json["post_media_name"],
        mediaType: json["media_type"],
        views: json["views"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post_id": postId,
        "post_media": postMedia,
        "post_media_name": postMediaName,
        "media_type": mediaType,
        "views": views,
        "created_at": createdAt,
      };
}

class TagsDetail {
  TagsDetail({
    this.id,
    this.postId,
    this.userId,
    this.firstName,
    this.lastName,
    this.userImage,
    this.tagBy,
    this.tagStatus,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
  });

  String? id;
  String? postId;
  String? userId;
  String? firstName;
  String? lastName;
  String? userImage;
  String? tagBy;
  String? tagStatus;
  String? createdAt;
  String? updatedAt;
  String? updatedBy;

  factory TagsDetail.fromJson(String str) =>
      TagsDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TagsDetail.fromMap(Map<String, dynamic> json) => TagsDetail(
        id: json["id"],
        postId: json["post_id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
        tagBy: json["tag_by"],
        tagStatus: json["tag_status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post_id": postId,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
        "tag_by": tagBy,
        "tag_status": tagStatus,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
      };
}

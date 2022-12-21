import 'package:iobm/networkcalls/response_models/event_detail_entity.dart';

eventDetailEntityFromJson(EventDetailEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = (json['result'] as List)
        .map((v) => EventDetailResult().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> eventDetailEntityToJson(EventDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  return data;
}

eventDetailResultFromJson(EventDetailResult data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'].toString();
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['start_date'] != null) {
    data.startDate = json['start_date'].toString();
  }
  if (json['end_date'] != null) {
    data.endDate = json['end_date'].toString();
  }
  if (json['venue'] != null) {
    data.venue = json['venue'].toString();
  }
  if (json['city'] != null) {
    data.city = json['city'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['created_by'] != null) {
    data.createdBy = json['created_by'].toString();
  }
  if (json['is_public'] != null) {
    data.isPublic = json['is_public'].toString();
  }
  if (json['start_time'] != null) {
    data.startTime = json['start_time'].toString();
  }
  if (json['end_time'] != null) {
    data.endTime = json['end_time'].toString();
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
  if (json['total_like'] != null) {
    data.totalLike = json['total_like'].toString();
  }
  if (json['is_like'] != null) {
    data.isLike = json['is_like'].toString();
  }
  if (json['total_comments'] != null) {
    data.totalComments = json['total_comments'].toString();
  }
  if (json['total_going'] != null) {
    data.totalGoing = json['total_going'].toString();
  }
  if (json['is_going'] != null) {
    data.isGoing = json['is_going'].toString();
  }
  if (json['total_interested'] != null) {
    data.totalInterested = json['total_interested'].toString();
  }
  if (json['is_interested'] != null) {
    data.isInterested = json['is_interested'].toString();
  }
  return data;
}

Map<String, dynamic> eventDetailResultToJson(EventDetailResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['image'] = entity.image;
  data['start_date'] = entity.startDate;
  data['end_date'] = entity.endDate;
  data['venue'] = entity.venue;
  data['city'] = entity.city;
  data['created_at'] = entity.createdAt;
  data['created_by'] = entity.createdBy;
  data['is_public'] = entity.isPublic;
  data['start_time'] = entity.startTime;
  data['end_time'] = entity.endTime;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  data['total_like'] = entity.totalLike;
  data['is_like'] = entity.isLike;
  data['total_comments'] = entity.totalComments;
  data['total_going'] = entity.totalGoing;
  data['is_going'] = entity.isGoing;
  data['total_interested'] = entity.totalInterested;
  data['is_interested'] = entity.isInterested;
  return data;
}

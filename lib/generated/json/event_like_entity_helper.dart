import 'package:iobm/networkcalls/response_models/event_like_entity.dart';

eventLikeEntityFromJson(EventLikeEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = EventLikeResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> eventLikeEntityToJson(EventLikeEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

eventLikeResultFromJson(EventLikeResult data, Map<String, dynamic> json) {
  if (json['likes'] != null) {
    data.likes = json['likes'] is String
        ? int.tryParse(json['likes'])
        : json['likes'].toInt();
  }
  return data;
}

Map<String, dynamic> eventLikeResultToJson(EventLikeResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['likes'] = entity.likes;
  return data;
}

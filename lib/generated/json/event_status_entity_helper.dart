import 'package:iobm/networkcalls/response_models/event_status_entity.dart';

eventStatusEntityFromJson(EventStatusEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = EventStatusResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> eventStatusEntityToJson(EventStatusEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

eventStatusResultFromJson(EventStatusResult data, Map<String, dynamic> json) {
  if (json['interested'] != null) {
    data.interested = json['interested'].toString();
  }
  if (json['going'] != null) {
    data.going = json['going'].toString();
  }
  if (json['likes'] != null) {
    data.likes = json['likes'].toString();
  }
  return data;
}

Map<String, dynamic> eventStatusResultToJson(EventStatusResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['interested'] = entity.interested;
  data['going'] = entity.going;
  data['likes'] = entity.likes;
  return data;
}

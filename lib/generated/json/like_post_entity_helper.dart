import 'package:iobm/networkcalls/response_models/like_post_entity.dart';

likePostEntityFromJson(LikePostEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = LikePostResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> likePostEntityToJson(LikePostEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

likePostResultFromJson(LikePostResult data, Map<String, dynamic> json) {
  if (json['likes'] != null) {
    data.likes = json['likes'] is String
        ? int.tryParse(json['likes'])
        : json['likes'].toInt();
  }
  return data;
}

Map<String, dynamic> likePostResultToJson(LikePostResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['likes'] = entity.likes;
  return data;
}

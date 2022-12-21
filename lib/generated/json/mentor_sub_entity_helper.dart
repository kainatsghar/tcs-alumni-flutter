import 'package:iobm/networkcalls/response_models/mentor_sub_entity.dart';

mentorSubEntityFromJson(MentorSubEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = json['result'].toString();
  }
  return data;
}

Map<String, dynamic> mentorSubEntityToJson(MentorSubEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result;
  return data;
}

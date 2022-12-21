import 'package:iobm/networkcalls/response_models/logout_entity.dart';

logoutEntityFromJson(LogoutEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = LogoutResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> logoutEntityToJson(LogoutEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

logoutResultFromJson(LogoutResult data, Map<String, dynamic> json) {
  if (json['status'] != null) {
    data.status = json['status'];
  }
  return data;
}

Map<String, dynamic> logoutResultToJson(LogoutResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['status'] = entity.status;
  return data;
}

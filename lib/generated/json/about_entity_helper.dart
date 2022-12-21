import 'package:iobm/networkcalls/response_models/about_entity.dart';

aboutEntityFromJson(AboutEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = AboutResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> aboutEntityToJson(AboutEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

aboutResultFromJson(AboutResult data, Map<String, dynamic> json) {
  if (json['mission'] != null) {
    data.mission = json['mission'].toString();
  }
  if (json['vission'] != null) {
    data.vission = json['vission'].toString();
  }
  if (json['message_from_ce'] != null) {
    data.messageFromCe = json['message_from_ce'].toString();
  }
  if (json['message_from_oar'] != null) {
    data.messageFromOar = json['message_from_oar'].toString();
  }
  if (json['objective'] != null) {
    data.objective = json['objective'].toString();
  }
  return data;
}

Map<String, dynamic> aboutResultToJson(AboutResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['mission'] = entity.mission;
  data['vission'] = entity.vission;
  data['message_from_ce'] = entity.messageFromCe;
  data['message_from_oar'] = entity.messageFromOar;
  data['objective'] = entity.objective;
  return data;
}

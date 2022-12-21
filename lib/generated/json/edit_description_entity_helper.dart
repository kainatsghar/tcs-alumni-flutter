import 'package:iobm/networkcalls/response_models/edit_description_entity.dart';

editDescriptionEntityFromJson(
    EditDescriptionEntity data, Map<String, dynamic> json) {
  if (json['result'] != null) {
    data.result = json['result'];
  }
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  return data;
}

Map<String, dynamic> editDescriptionEntityToJson(EditDescriptionEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['result'] = entity.result;
  data['success'] = entity.success;
  data['message'] = entity.message;
  return data;
}

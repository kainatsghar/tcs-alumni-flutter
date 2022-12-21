import 'package:iobm/networkcalls/response_models/add_interest_entity.dart';

addInterestEntityFromJson(AddInterestEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = json['result'];
  }
  return data;
}

Map<String, dynamic> addInterestEntityToJson(AddInterestEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result;
  return data;
}

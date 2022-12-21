import 'package:iobm/networkcalls/response_models/enable_loc_sharing_entity.dart';

enableLocSharingEntityFromJson(
    EnableLocSharingEntity data, Map<String, dynamic> json) {
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

Map<String, dynamic> enableLocSharingEntityToJson(
    EnableLocSharingEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  return data;
}

import 'package:iobm/networkcalls/response_models/insert_offer_entity.dart';

insertOfferEntityFromJson(InsertOfferEntity data, Map<String, dynamic> json) {
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

Map<String, dynamic> insertOfferEntityToJson(InsertOfferEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result;
  return data;
}

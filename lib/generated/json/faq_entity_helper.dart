import 'package:iobm/networkcalls/response_models/faq_entity.dart';
import 'package:iobm/local_db/local_db.dart';

faqEntityFromJson(FaqEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result =
        (json['result'] as List).map((v) => DBFaq.fromJson(v)).toList();
  }
  return data;
}

Map<String, dynamic> faqEntityToJson(FaqEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.map((v) => v.toJson()).toList();
  return data;
}

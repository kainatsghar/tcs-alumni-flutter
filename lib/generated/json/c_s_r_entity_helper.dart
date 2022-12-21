import 'package:iobm/networkcalls/response_models/c_s_r_entity.dart';
import 'package:iobm/local_db/local_db.dart';

cSREntityFromJson(CSREntity data, Map<String, dynamic> json) {
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
        (json['result'] as List).map((v) => DBCSR.fromJson(v)).toList();
  }
  return data;
}

Map<String, dynamic> cSREntityToJson(CSREntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.map((v) => v.toJson()).toList();
  return data;
}

cSRResultFromJson(CSRResult data, Map<String, dynamic> json) {
  if (json['csr_id'] != null) {
    data.csrId = json['csr_id'].toString();
  }
  if (json['csr_title'] != null) {
    data.csrTitle = json['csr_title'].toString();
  }
  if (json['csr_description'] != null) {
    data.csrDescription = json['csr_description'].toString();
  }
  if (json['from_date'] != null) {
    data.fromDate = json['from_date'].toString();
  }
  if (json['to_date'] != null) {
    data.toDate = json['to_date'].toString();
  }
  if (json['is_interested'] != null) {
    data.isInterested = json['is_interested'] is String
        ? int.tryParse(json['is_interested'])
        : json['is_interested'].toInt();
  }
  return data;
}

Map<String, dynamic> cSRResultToJson(CSRResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['csr_id'] = entity.csrId;
  data['csr_title'] = entity.csrTitle;
  data['csr_description'] = entity.csrDescription;
  data['from_date'] = entity.fromDate;
  data['to_date'] = entity.toDate;
  data['is_interested'] = entity.isInterested;
  return data;
}

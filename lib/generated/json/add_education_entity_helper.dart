import 'package:iobm/networkcalls/response_models/add_education_entity.dart';

addEducationEntityFromJson(AddEducationEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = AddEducationResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> addEducationEntityToJson(AddEducationEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

addEducationResultFromJson(AddEducationResult data, Map<String, dynamic> json) {
  if (json['education'] != null) {
    data.education = (json['education'] as List)
        .map((v) => AddEducationResultEducation().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> addEducationResultToJson(AddEducationResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['education'] = entity.education.map((v) => v.toJson()).toList();
  return data;
}

addEducationResultEducationFromJson(
    AddEducationResultEducation data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['institute'] != null) {
    data.institute = json['institute'].toString();
  }
  if (json['program'] != null) {
    data.program = json['program'].toString();
  }
  if (json['start_date'] != null) {
    data.startDate = json['start_date'].toString();
  }
  if (json['end_date'] != null) {
    data.endDate = json['end_date'].toString();
  }
  return data;
}

Map<String, dynamic> addEducationResultEducationToJson(
    AddEducationResultEducation entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['institute'] = entity.institute;
  data['program'] = entity.program;
  data['start_date'] = entity.startDate;
  data['end_date'] = entity.endDate;
  return data;
}

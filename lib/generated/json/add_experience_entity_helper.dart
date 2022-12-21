import 'package:iobm/networkcalls/response_models/add_experience_entity.dart';

addExperienceEntityFromJson(
    AddExperienceEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = AddExperienceResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> addExperienceEntityToJson(AddExperienceEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

addExperienceResultFromJson(
    AddExperienceResult data, Map<String, dynamic> json) {
  if (json['experience'] != null) {
    data.experience = (json['experience'] as List)
        .map((v) => AddExperienceResultExperience().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> addExperienceResultToJson(AddExperienceResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['experience'] = entity.experience.map((v) => v.toJson()).toList();
  return data;
}

addExperienceResultExperienceFromJson(
    AddExperienceResultExperience data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['position'] != null) {
    data.position = json['position'].toString();
  }
  if (json['campany_name'] != null) {
    data.campanyName = json['campany_name'].toString();
  }
  if (json['company_image'] != null) {
    data.companyImage = json['company_image'].toString();
  }
  if (json['logo_changeable'] != null) {
    data.logoChangeable = json['logo_changeable'].toString();
  }
  if (json['start_date'] != null) {
    data.startDate = json['start_date'].toString();
  }
  if (json['end_date'] != null) {
    data.endDate = json['end_date'].toString();
  }
  return data;
}

Map<String, dynamic> addExperienceResultExperienceToJson(
    AddExperienceResultExperience entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['position'] = entity.position;
  data['campany_name'] = entity.campanyName;
  data['company_image'] = entity.companyImage;
  data['logo_changeable'] = entity.logoChangeable;
  data['start_date'] = entity.startDate;
  data['end_date'] = entity.endDate;
  return data;
}

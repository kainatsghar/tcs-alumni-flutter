import 'package:iobm/networkcalls/response_models/designation_hints_entity.dart';
import 'package:iobm/local_db/local_db.dart';

designationHintsEntityFromJson(
    DesignationHintsEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['designations'] != null) {
    data.designations = (json['designations'] as List)
        .map((v) => DBDesignation.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> designationHintsEntityToJson(
    DesignationHintsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['designations'] = entity.designations?.map((v) => v.toJson()).toList();
  return data;
}

designationHintsDesignationsFromJson(
    DesignationHintsDesignations data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['is_active'] != null) {
    data.isActive = json['is_active'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  if (json['update_date'] != null) {
    data.updateDate = json['update_date'].toString();
  }
  return data;
}

Map<String, dynamic> designationHintsDesignationsToJson(
    DesignationHintsDesignations entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['is_active'] = entity.isActive;
  data['is_deleted'] = entity.isDeleted;
  data['update_date'] = entity.updateDate;
  return data;
}

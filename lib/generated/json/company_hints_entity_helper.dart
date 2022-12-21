import 'package:iobm/networkcalls/response_models/company_hints_entity.dart';
import 'package:iobm/local_db/local_db.dart';

companyHintsEntityFromJson(CompanyHintsEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['company_hints'] != null) {
    data.companyHints = (json['company_hints'] as List)
        .map((v) => DBCompanie.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> companyHintsEntityToJson(CompanyHintsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['company_hints'] = entity.companyHints?.map((v) => v.toJson()).toList();
  return data;
}

companyHintsCompanyHintsFromJson(
    CompanyHintsCompanyHints data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['logo_changeable'] != null) {
    data.logoChangeable = json['logo_changeable'].toString();
  }
  if (json['workers'] != null) {
    data.workers = json['workers'] is String
        ? int.tryParse(json['workers'])
        : json['workers'].toInt();
  }
  return data;
}

Map<String, dynamic> companyHintsCompanyHintsToJson(
    CompanyHintsCompanyHints entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['image'] = entity.image;
  data['logo_changeable'] = entity.logoChangeable;
  data['workers'] = entity.workers;
  return data;
}

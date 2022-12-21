import 'package:iobm/networkcalls/response_models/settings_entity.dart';
import 'package:iobm/local_db/local_db.dart';

settingsEntityFromJson(SettingsEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = SettingsResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> settingsEntityToJson(SettingsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

settingsResultFromJson(SettingsResult data, Map<String, dynamic> json) {
  if (json['countries'] != null) {
    data.countries =
        (json['countries'] as List).map((v) => DBCountrie.fromJson(v)).toList();
  }
  if (json['cities'] != null) {
    data.cities =
        (json['cities'] as List).map((v) => DBCitie.fromJson(v)).toList();
  }
  if (json['branches'] != null) {
    data.branches =
        (json['branches'] as List).map((v) => DBBranche.fromJson(v)).toList();
  }
  if (json['industries'] != null) {
    data.industries = (json['industries'] as List)
        .map((v) => DBIndustrie.fromJson(v))
        .toList();
  }
  if (json['report_types'] != null) {
    data.reportTypes = (json['report_types'] as List)
        .map((v) => DBReportType.fromJson(v))
        .toList();
  }
  if (json['degrees'] != null) {
    data.degrees =
        (json['degrees'] as List).map((v) => DBDegree.fromJson(v)).toList();
  }
  if (json['MOBILE_API_BASE_URL'] != null) {
    data.mobileApiBaseUrl = json['MOBILE_API_BASE_URL'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultToJson(SettingsResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['countries'] = entity.countries?.map((v) => v.toJson()).toList();
  data['cities'] = entity.cities?.map((v) => v.toJson()).toList();
  data['branches'] = entity.branches?.map((v) => v.toJson()).toList();
  data['industries'] = entity.industries?.map((v) => v.toJson()).toList();
  data['report_types'] = entity.reportTypes?.map((v) => v.toJson()).toList();
  data['degrees'] = entity.degrees?.map((v) => v.toJson()).toList();
  data['MOBILE_API_BASE_URL'] = entity.mobileApiBaseUrl;
  return data;
}

settingsResultCountriesFromJson(
    SettingsResultCountries data, Map<String, dynamic> json) {
  if (json['country_id'] != null) {
    data.countryId = json['country_id'].toString();
  }
  if (json['country_name'] != null) {
    data.countryName = json['country_name'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultCountriesToJson(
    SettingsResultCountries entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['country_id'] = entity.countryId;
  data['country_name'] = entity.countryName;
  data['is_deleted'] = entity.isDeleted;
  return data;
}

settingsResultCitiesFromJson(
    SettingsResultCities data, Map<String, dynamic> json) {
  if (json['country_id'] != null) {
    data.countryId = json['country_id'].toString();
  }
  if (json['city_id'] != null) {
    data.cityId = json['city_id'].toString();
  }
  if (json['city_name'] != null) {
    data.cityName = json['city_name'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultCitiesToJson(SettingsResultCities entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['country_id'] = entity.countryId;
  data['city_id'] = entity.cityId;
  data['city_name'] = entity.cityName;
  data['is_deleted'] = entity.isDeleted;
  return data;
}

settingsResultBranchesFromJson(
    SettingsResultBranches data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['city_id'] != null) {
    data.cityId = json['city_id'].toString();
  }
  if (json['country_id'] != null) {
    data.countryId = json['country_id'].toString();
  }
  if (json['chapter_id'] != null) {
    data.chapterId = json['chapter_id'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultBranchesToJson(
    SettingsResultBranches entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['city_id'] = entity.cityId;
  data['country_id'] = entity.countryId;
  data['chapter_id'] = entity.chapterId;
  data['is_deleted'] = entity.isDeleted;
  return data;
}

settingsResultIndustriesFromJson(
    SettingsResultIndustries data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultIndustriesToJson(
    SettingsResultIndustries entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['is_deleted'] = entity.isDeleted;
  return data;
}

settingsResultReportTypesFromJson(
    SettingsResultReportTypes data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['text'] != null) {
    data.text = json['text'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultReportTypesToJson(
    SettingsResultReportTypes entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['text'] = entity.text;
  data['created_at'] = entity.createdAt;
  data['is_deleted'] = entity.isDeleted;
  return data;
}

settingsResultDegreesFromJson(
    SettingsResultDegrees data, Map<String, dynamic> json) {
  if (json['degree_id'] != null) {
    data.degreeId = json['degree_id'].toString();
  }
  if (json['branch_id'] != null) {
    data.branchId = json['branch_id'].toString();
  }
  if (json['degree_name'] != null) {
    data.degreeName = json['degree_name'].toString();
  }
  if (json['degree_description'] != null) {
    data.degreeDescription = json['degree_description'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  if (json['update_date'] != null) {
    data.updateDate = json['update_date'].toString();
  }
  return data;
}

Map<String, dynamic> settingsResultDegreesToJson(SettingsResultDegrees entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['degree_id'] = entity.degreeId;
  data['branch_id'] = entity.branchId;
  data['degree_name'] = entity.degreeName;
  data['degree_description'] = entity.degreeDescription;
  data['is_deleted'] = entity.isDeleted;
  data['update_date'] = entity.updateDate;
  return data;
}
